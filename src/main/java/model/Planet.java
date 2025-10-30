package model;

public class Planet {
    private int id;
    private String name;
    private String image;
    private String description;
    private String distance;

    // --- Getter / Setter ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getDistance() { return distance; }
    public void setDistance(String distance) { this.distance = distance; }
}
