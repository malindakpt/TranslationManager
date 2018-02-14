package entityManager;

import configuration.HibernateUtil;
import entity.Entity;
import org.hibernate.*;

import java.util.HashMap;
import java.util.List;

/**
 * Created by MalindaK on 12/9/2017.
 */
public class EntityManager {
    public void add(Entity entity){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(entity);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /* Method to DELETE an employee from the records */
    public void delete(Class entity,String colName, String value){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("delete "+entity.getSimpleName()+" where "+colName+" = :value");
            query.setParameter("value", value);
            query.executeUpdate();
            tx.commit();
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    public void delete2(Class entity,String colName1, String value1,String colName2, String value2){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("delete "+entity.getSimpleName()+" where "+colName1+" = :value1 AND "+colName2+" = :value2");
            query.setParameter("value1", value1);
            query.setParameter("value2", value2);
            query.executeUpdate();
            tx.commit();
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void update(Entity entity){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.update(entity);
            tx.commit();

        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Session createSession(){
        return HibernateUtil.getSessionFactory().openSession();
    }

    public Entity getEntity(Session session, Class entity,String idCol, String id){
        List<Entity> entities;
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+idCol+"= :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", Integer.parseInt(id));

            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities.get(0);
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return null;
    }

    public Entity getEntity(Class entity,String idCol, String id){
        List<Entity> entities;
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+idCol+"= :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", Integer.parseInt(id));

            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities.get(0);
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public Entity getFirstEntity1(Class entity,String col1, String val1){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+col1+"= :val1";
            Query query = session.createQuery(hql);
            query.setParameter("val1", val1);
            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities.get(0);
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public List<Entity> getEntity1(Class entity,String col1, String val1){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+col1+"= :val1";
            Query query = session.createQuery(hql);
            query.setParameter("val1", val1);
            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities;
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public List<Entity> getEntity2(Class entity,String col1, String val1, String col2, String val2){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+col1+"= :val1 AND " +col2+"= :val2";
            Query query = session.createQuery(hql);
            query.setParameter("val1", val1);
            query.setParameter("val2", val2);
            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities;
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public Entity getFirstEntity2(Class entity,String col1, String val1, String col2, String val2){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+col1+"= :val1 AND " +col2+"= :val2";
            Query query = session.createQuery(hql);
            query.setParameter("val1", val1);
            query.setParameter("val2", val2);
            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities.get(0);
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public List<Entity> getEntities(Class entity){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            entities = session.createQuery("FROM "+entity.getSimpleName()).list();

            tx.commit();
            return entities;
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public static List<Entity> getOrderedEntities(Class entity, String orderedAttr, boolean isAsc){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;
        String order = isAsc ? "asc" : "desc";

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" order by "+orderedAttr+" " + order;
            Query query = session.createQuery(hql);
            entities = query.list();
            tx.commit();
            return entities;
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    public List<Object> searchKeys(String searchKey){
        searchKey = searchKey.replace("\\", "\\\\\\\\");
        List<Object> entities = null;
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            String hql="SELECT emp.languageTerm from TranslationEntity emp WHERE emp.languageTerm like '%"+searchKey+"%'";
            Query query=session.createQuery(hql);
            entities = query.list();

            tx.commit();
            return entities;
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public List<Entity> getProductLanguageTranslations(String productId){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM  ProductTranslation pt WHERE productId= :productId order by pt.localizationKey asc";
            Query query = session.createQuery(hql);
            query.setParameter("productId", productId);
            entities = query.list();
            tx.commit();

            if(entities.size()>0){
                return entities;
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

}
