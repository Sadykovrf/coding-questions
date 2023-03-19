#include <stdio.h>
#include <stdlib.h>
int main(void)
{
    int nums[100],i,j,size,target,sum=0;
    scanf("%d",&size);
    for(i=0;i<size;i++)
    {
        scanf("%d",&nums[i]);
    }
    scanf("%d",&target);
    for(i=0;i<size;i++)
    {
        for(j=i+1;j<size;j++)
        {
            sum=nums[i]+nums[j];
            if(sum==target)
            {
                printf("[%d, %d]",i,j);
            }
        }
    }
    return 0;
}
