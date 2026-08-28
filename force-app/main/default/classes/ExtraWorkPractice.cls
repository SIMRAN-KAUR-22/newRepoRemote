public class ExtraWorkPractice {
		public static void mapWork(integer mmapId)
        { //keys - unique; values- can be identical
            // put method
            MAP <integer, string> mmap = new MAP <integer, string>();
            mmap.put (1,'first');
            mmap.put (2,'second');
            mmap.put (3,'third');
            system.debug ('original data' + mmap);
             //remove method
            mmap.remove (3);
            system.debug ('new data' + mmap);
            //how replacement works
            mmap.put (3, 'replaced with new');
            system.debug ('new overwritten data' + mmap);
            
            
            //keyset method
            //value method
            system.debug ('keyset method gives:' + mmap.keyset () );
            system.debug ('value method gives:' + mmap.values ());
            system.debug ('total values:' + mmap.size ());
            //is the map empty?
            system.debug ('is the map empty? -' + mmap.isempty ());
            // if you are seeking details of an employee :: public static void mapWork(integer mmapId)
            system.debug ('you are seeking information for employee:' + mmap.get (mmapId)); 
        }
}