public with sharing class Demo {
    public static void printData(){
       /*List<String> nameList = new List<String>();
        nameList.add('rakhi');
        nameList.add('shivi');
        nameList.add('abhijeet');
        System.debug(nameList);
        
        for (String names: nameList){
            System.debug(names);
        }
        */
        
        /*
        System.debug('Set');
        Set<string> nameSet = new Set<String>();
        nameSet.add('rakhi');
        nameSet.add('shivi');
        nameSet.add('abhijeet');
        nameSet.add('Rakhi');
        */

        Map <Integer, String> mapNames = new Map<Integer, String>();
        mapNames.put(0,'rakhi');
        mapNames.put(1,'shivi');
        mapNames.put(2,'abhijeet');
        System.debug(mapNames);
        
        System.debug(mapNames.get(1));
        
        If(mapNames.containsKey(1))
        { 
            mapNames.put(1,'mirketa');
        }
        System.debug(mapNames);
        
        for (Integer i=0; i<15; i++) {
            mapNames.put(i, 'Mirketa'+i );
        }
        
            
        System.debug(mapNames.keySet());
        System.debug(mapNames.values());
        
       
       
        for (Integer index: mapNames.keySet()){
            System.debug('index= '+index);
            System.debug('value= '+mapNames.get(index));
        }
        
            
    
    }
}