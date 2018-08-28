From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Tue, 28 Aug 2018 09:12:33 +0100
Subject: [PATCH] Revert "net: stmmac: Do not keep rearming the coalesce
 timer in stmmac_xmit"
In-Reply-To: <20180824090440.13411-1-jbrunet@baylibre.com>
References: <20180824090440.13411-1-jbrunet@baylibre.com>
Message-ID: <d3858ef0-97c7-28b5-db4a-4ac71af52ba5@synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

On 24-08-2018 10:04, Jerome Brunet wrote:
> This reverts commit 4ae0169fd1b3c792b66be58995b7e6b629919ecf.
>
> This change in the handling of the coalesce timer is causing regression on
> (at least) amlogic platforms.
>
> Network will break down very quickly (a few seconds) after starting
> a download. This can easily be reproduced using iperf3 for example.
>
> The problem has been reported on the S805, S905, S912 and A113 SoCs
> (Realtek and Micrel PHYs) and it is likely impacting all Amlogics
> platforms using Gbit ethernet
>
> No problem was seen with the platform using 10/100 only PHYs (GXL internal)
>
> Reverting change brings things back to normal and allows to use network
> again until we better understand the problem with the coalesce timer.
>
>

Apologies for the delayed answer but I was in FTO.

I'm not sure what can be causing this but I have some questions
for you:
    - What do you mean by "network will break down"? Do you see
queue timeout?
    - What do you see in ethtool/ifconfig stats? Can you send me
the stats before and after network break?
    - Is your setup multi-queue/channel?
    - Can you point me to the DT bindings of your setup?

Thanks and Best Regards,
Jose Miguel Abreu
