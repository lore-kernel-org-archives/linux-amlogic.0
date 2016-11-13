From: neolynx@gmail.com (=?UTF-8?B?QW5kcsOp?= Roth)
Date: Sun, 13 Nov 2016 20:20:20 +0100
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <1478190980.6632.26.camel@baylibre.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ff6f3501-fbd5-3e79-dcc1-549406a5144b@st.com>
 <CAFBinCD42A_SqQz8GM-H+A32dMELknAytHuJ5T2YgZ3BrMKA3A@mail.gmail.com>
 <20160917232312.1e30d425@gmail.com>
 <d59f6e2c-15ff-779d-da2f-8eb5f5a535a6@st.com>
 <CAFBinCD_-KjVa70iOhBSGaXZc9uKy2m4d2yVr-AfLiV7F=3EqQ@mail.gmail.com>
 <1478190980.6632.26.camel@baylibre.com>
Message-ID: <20161113202020.1acf2e1e@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Hi all,

> To everybody having similar issue with their OdroidC2, could you try
> the attached patch and let us know if it changes anything for you ?

I can confirm that this patch removes the problem, I have now constant
~300Mb/s in both directions without any issue ! :)

I used the v4.10/integ branch, which shows the problem without applying
this patch. 

Thanks for your work,

 Andr? 
