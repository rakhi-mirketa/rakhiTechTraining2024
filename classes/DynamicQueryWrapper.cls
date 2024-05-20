public class DynamicQueryWrapper {
	public class WrapperClass{ 
	String fieldApiName;
    String operator;
    String value;
    String dataType;
        public WrapperClass (String fieldApiName, String operator, String value, String dataType){
            this.fieldApiName=fieldApiName;
            this.operator=operator;
			this.value = value;
            this.dataType = dataType;
        }
    }
    
    public static List<Id> queryRecords(String objectName, List<WrapperClass> conditions){
        Map<String, Object> nameBind  = new Map<String, Object>();
        String StrQuery = 'SELECT Id FROM ' + objectName + ' WHERE ';
        for(Integer i=0;i<conditions.size();i++){
            if(conditions[i].dataType == 'STRING'){
                StrQuery  = StrQuery + conditions[i].fieldApiName + ' ' + conditions[i].operator + ' ' + ':nBind'+i;

                if(i < conditions.size() - 1){
                    StrQuery += ' AND ';
                }
                List<String> part = conditions[i].value.split(';');
                nameBind.put('nBind'+i , part);
            }
            else if(conditions[i].dataType == 'INTEGER'){
                StrQuery  = StrQuery + conditions[i].fieldApiName + ' ' + conditions[i].operator + ' ' + ':nBind'+i;
                if(i < conditions.size() - 1){
                    StrQuery += ' AND ';
                }
                
                List<String> part = conditions[i].value.split(';');
                List<Integer> numPart = new List<Integer>();
                for(Integer j=0;j<part.size();j++){
                    numPart.add(Integer.valueOf(part[i]) );
                }
                nameBind.put('nBind'+i , numPart);
            }
            
                
        }
        system.debug(StrQuery);
        system.debug(nameBind);
        List<Sobject> queriedRecords = Database.queryWithBinds(StrQuery, nameBind , AccessLevel.USER_MODE);
        List<Id> objId = new List<Id>();
        for(Sobject i : queriedRecords){
            objId.add(i.Id);
        }
        //system.debug(objId);
        return objId;
    }
}