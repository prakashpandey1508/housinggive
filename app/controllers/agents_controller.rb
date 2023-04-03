class AgentsController < ApplicationController
  def index
    @agents=Agent.all
    @companies=Company.all
  end

  def show
   agent_id
   @agents=Agent.find(params[:id])
   @companies=Company.all
   @commentable=@agents
   @comments=@commentable.comments
   @comment=Comment.new





  end
   def new
     @agent=Agent.new 
   end
  def create
    @agent = Agent.create(agent_params)
    if @agent.valid?
      redirect_to agents_index_path(@agent)
    else
      render :new
    end
  end
 

  def edit
    agent_id
  end
  def update
     agent_id
     if @agent.update(agent_params)
      redirect_to agent_path(@agent)
     else
      render :edit
     end
  end
  def destroy
    Agent.destroy(params[:id])
    
    redirect_to agents_path
  end
  private

  def agent_params
    params.require(:agent).permit(:name,:age,:number, :email,:address,:company_id)
  end

  def agent_id
    @agent=Agent.find(params[:id])
  end

end
