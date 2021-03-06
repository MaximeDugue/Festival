/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pkjVue;

import java.util.Iterator;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import org.hibernate.Query;
import org.hibernate.Session;
import pkgEntite.HibernateUtil;
import pkgEntite.Typechambre;
import pkjVue.jfPrincipal;

/**
 *
 * @author etudSIO
 */
public class jpTypeChambre extends javax.swing.JPanel {
   private boolean bCharge = false; //utilisé lors du chargement de la liste déroulante
   private Typechambre unType;
    /**
     * Creates new form jpTypeChambre
     */
   //JOptionPane.
    
    public jpTypeChambre() {
        initComponents();
        
    }
    
    
    public void jtblTypeChambreAction(){
        String sQuery;
        int i;
        //vide le tableau si il y a des ligne présente
        int nbligne= jtblTypeChambre.getRowCount();
        if(nbligne>0){
           for (i=0;i<nbligne;i++){
               ((DefaultTableModel)jtblTypeChambre.getModel()).removeRow(0);
           }
        }
        
       //fait le tableau
        sQuery="from Typechambre";
        jfPrincipal.getSession().beginTransaction();
        Query q=jfPrincipal.getSession().createQuery(sQuery);
        Iterator par= q.iterate();
        while(par.hasNext()){
            Typechambre unType = (Typechambre) par.next();
            ((DefaultTableModel)jtblTypeChambre.getModel()).addRow(new Object[] 
            {unType.getId(), unType.getLibelle()});
        }
        }
        
        
        
    

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jtblTypeChambre = new javax.swing.JTable();
        jbtnAjoutTypeChambre = new javax.swing.JButton();
        jbtnModifierTypeChambre = new javax.swing.JButton();
        jbtnSupprimerTypeChambre = new javax.swing.JButton();

        jLabel1.setText("TYPE DE CHAMBRE");

        jtblTypeChambre.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null},
                {null, null}
            },
            new String [] {
                "Code", "Nombre de lits"
            }
        ));
        jScrollPane1.setViewportView(jtblTypeChambre);

        jbtnAjoutTypeChambre.setText("Ajouter");

        jbtnModifierTypeChambre.setText("Modifier");

        jbtnSupprimerTypeChambre.setText("Supprimer");
        jbtnSupprimerTypeChambre.setToolTipText("");
        jbtnSupprimerTypeChambre.setActionCommand("Supprimer");
        jbtnSupprimerTypeChambre.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbtnSupprimerTypeChambreActionPerformed(evt);
            }
        });

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(142, 142, 142)
                .add(jLabel1)
                .add(167, 167, 167))
            .add(layout.createSequentialGroup()
                .add(15, 15, 15)
                .add(jbtnAjoutTypeChambre)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .add(jbtnModifierTypeChambre)
                .add(68, 68, 68)
                .add(jbtnSupprimerTypeChambre)
                .add(23, 23, 23))
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jLabel1)
                .add(37, 37, 37)
                .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 123, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 85, Short.MAX_VALUE)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jbtnAjoutTypeChambre)
                    .add(jbtnModifierTypeChambre)
                    .add(jbtnSupprimerTypeChambre))
                .add(36, 36, 36))
        );

        jbtnSupprimerTypeChambre.getAccessibleContext().setAccessibleName("Supprimer");
    }// </editor-fold>//GEN-END:initComponents

    private void jbtnSupprimerTypeChambreActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbtnSupprimerTypeChambreActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jbtnSupprimerTypeChambreActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton jbtnAjoutTypeChambre;
    private javax.swing.JButton jbtnModifierTypeChambre;
    private javax.swing.JButton jbtnSupprimerTypeChambre;
    private javax.swing.JTable jtblTypeChambre;
    // End of variables declaration//GEN-END:variables
}
