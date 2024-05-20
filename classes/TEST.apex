List<DynamicQueryWrapper.WrapperClass> condition = new List<DynamicQueryWrapper.WrapperClass>();
List<Account> acc = [SELECT Name From Account];
List<String> accName = new List<String>();
for(Account a : acc){
    accName.add(a.Name);
}
condition.add(new DynamicQueryWrapper.WrapperClass('Name','IN', accName , 'LIST'));
condition.add(new DynamicQueryWrapper.WrapperClass('Industry', '=', 'Agriculture' , 'STRING'));
condition.add(new DynamicQueryWrapper.WrapperClass('Type', '=', 'Prospect' , 'STRING'));
condition.add(new DynamicQueryWrapper.WrapperClass('AnnualRevenue', '>=', 300 , 'INTEGER'));

List<Id> queriedRecordIds = DynamicQueryWrapper.queryRecords('Account', condition);
system.debug(queriedRecordIds);