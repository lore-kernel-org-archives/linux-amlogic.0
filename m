From: peppe.cavallaro@st.com (Giuseppe CAVALLARO)
Date: Mon, 19 Sep 2016 07:38:18 +0200
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <20160918224240.0bf5a9ed@gmail.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ce15ad26-2d07-655d-b813-947ad86696ac@st.com>
 <20160918224240.0bf5a9ed@gmail.com>
Message-ID: <22bfe293-02b0-e7f6-b11f-9d7a51d23a79@st.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Andr?

On 9/18/2016 10:42 PM, Andr? Roth wrote:
>
> Hello,
>
>> For example, you could try disabling the scatter-gather or tx-cum
>> via ethtool and seeing if there is some benefit; so we could image
>> some problem on your HW or SYNP MAC integration for checksumming
>> on tx side.
>
> disabling the following:
>   ethtool -K eth0 sg off
> or:
>   ethtool -K eth0 tx off
> does not prevent the network communication going down..
>
>> Also you could check the AXI tuning and PBL value. To be honest
>> (thinking about your problem) I can actually suspect some related
>> problem on bus setup. So I suggest you to play with these value
>> (better if you ask for having values from HW validation on your side).
>> Otherwise the stmmac uses a default that cannot be good for your
>> platform. For example, sometime I have seen that PBL is better if
>> reduced to 8 instead of 32 and w/o 4xPBL...
>
> how can I set those values ?
>
> thanks for your time,

welcome

take a look at Documentation/devicetree/bindings/net/stmmac.txt

peppe

>
>  andre
>
>
