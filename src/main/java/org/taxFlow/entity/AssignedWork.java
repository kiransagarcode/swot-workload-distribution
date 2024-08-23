package org.taxFlow.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class AssignedWork {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    private Workitem workitem;

    @ManyToOne
    private Users assistant;

    private boolean assigned;

    @Temporal(TemporalType.TIMESTAMP)
    private Date assignedDate;
    
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date completionDate;

	private boolean completed;
    
    @PrePersist
    protected void onCreate() {
        assignedDate = new Date();
    }

    // Getter and Setter methods for workitem, assistant, assigned, and assignedDate
    public Workitem getWorkitem() {
        return workitem;
    }
    public int getId() {
        return id;
    }

    public void setWorkitem(Workitem workitem) {
        this.workitem = workitem;
    }

    public Users getAssistant() {
        return assistant;
    }

    public void setAssistant(Users assistant) {
        this.assistant = assistant;
    }

    public boolean isAssigned() {
        return assigned;
    }

    public void setAssigned(boolean assigned) {
        this.assigned = assigned;
    }

    public Date getAssignedDate() {
        return assignedDate;
    }

    public void setAssignedDate(Date assignedDate) {
        this.assignedDate = assignedDate;
    }
    public void markAsComplete() {
        this.setCompleted(true);
        this.completionDate = new Date(); // Set the completion date to the current date and time
    }
    
	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
}
