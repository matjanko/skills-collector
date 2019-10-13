package com.github.matjanko.skillscollector.model.entities;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "sources")
public class Source {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", length = 20)
    private long id;

    @Column(name = "description")
    private String description;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @ManyToMany()
    @JoinTable(name="sources_attached_skills",
            joinColumns={@JoinColumn(name="source_id", referencedColumnName="id")},
            inverseJoinColumns={@JoinColumn(name="skill_id", referencedColumnName="id")})
    private List<Skill> skills;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Skill> getSkills() {
        return skills;
    }

    public void setSkills(List<Skill> skills) {
        this.skills = skills;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Source source = (Source) o;
        return id == source.id &&
                Objects.equals(description, source.description) &&
                name.equals(source.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, description, name);
    }

    @Override
    public String toString() {
        return "Source{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
