Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C608C43444
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:24:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED47220855
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CXqUXrj2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED47220855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fMkHoZEsmT7Bc9UqTtA5VNPL7VcUQPZ4k8tIttY74kk=; b=CXqUXrj2NPgJ6KB5ob+0ZsaFdN
	Wzkri2Pgx3Jbl4Uiq3ePLu4dniksFLKX5ePuuH4rE2owzSxzYHqSGB9nppM8tsvb+ygkb2WImqsRL
	xfZKvrHoVrfrAotjYtB1KZccUTewZYXSG/8YPEgooq3HNbXfM6rfZ72xiPUu3GWMWBvJfJCYsK2Rd
	gUN/yGtC9hhG7c0c3y8pg1In1UhPfrfMrqmoqFfbfeaLE+TPMk8nmetohCq1vFjgid5IHKHdkN6LT
	Zlxf4rgrhMcVnAqPwZtr729sJuztaRq7k879QkXkzaEiUb4Lb6WyxEhja/e3K/C6pX2kyVJTPeNRx
	Iw3/JMVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkF8v-0007Iy-Qt; Thu, 17 Jan 2019 21:24:05 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkF8s-0007IE-W4
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 21:24:04 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MbsV8-1gUE9t1YNq-00JIAU; Thu, 17
 Jan 2019 22:23:55 +0100
Subject: Re: stmmac / meson8b-dwmac
To: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org, Gpeppe.cavallaro@st.com, alexandre.torgue@st.com
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
From: Simon Huelck <simonmail@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=simonmail@gmx.de; prefer-encrypt=mutual; keydata=
 mQGiBD/bCNARBACE3URTBXZ/AA03NwRNtz03ewQn3uhvYSTjfqgplBtb3dfC4a79BXDRIWVX
 xPGH9Ewios1c8gMu3/RI2l3JzXoISfw5b0L/5igyPKV+sGuUA2FD27kYtPaaF/TqEWIv+Yxp
 9DCjCX5IQSYyvCfcxcyEkY8eVWxnaAlV3zKRR8wn0wCglWIOtAugBcg1YXmoLpFZE8Ca0fkD
 /jG+n4U9DPfCgkbgjQ/dv2W2a0ZDHccA9N8AW/FTXGyXXO0e7ql9/kORJnp7jD7/Z9HCKpeS
 HajgxuX9Vhfx6bH1dAMfsg88+K8pOO9oulNX1+YffQyZWOfdbmnZDUzBt9HKR9Wgh8WoIyw9
 TVluclzn6hYz+z9jbqHWMOsiCu8zA/0apHbW8vaIDT4+nNUxNdqU1TKa9kW47vNjwYYL0jZW
 TXNjDIRpqJVSugYVc/U847GoVoxyvtzre4TAbBV8h0BAOeMdxI5En67RGWzeNaMDJV1bwapj
 qdfj3e/X8rnGIfwz47rwztLNKoAIUlKrATwroiI7UNT+84G7H5qalu+Eu7QqU2ltb24gSHVl
 bGNrIDxzaW1vbi5odWVsY2tAZ29vZ2xlbWFpbC5jb20+iGIEExECACIFAlH7wL4CGyMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEJNSVvfBt05KlBQAn1JDO7e4H3N0WFJkZnxvObhk
 2kiAAJwPdDd6T1TuGo4iDIENRhAX4AH2KrkBDQQ/2wjSEAQAj6JnDDQzIIYzPGsrHRvaq8vw
 n8VrZCbPRvkngGvtQIss5pH/MLeu9jLepDGO9WHByFSg4QJh8cINYwTLtX8Bu0naA6ZI46hn
 GyfxdRlxSU9dRqHpU3G0tymL1w3AER6aVSfdXQTmFgf61anKunbIIptkqzZurkjnxkwCE/RM
 RscABA0D/jhglpj8siSIAxs8XLVfKJrjzbYM9/wS0NfdSXBeQJiYtKrY0WMNsqjY50wDnLMg
 anORN/odT6mCwKI6xChzxEv/ta4+teZl92aitziSuqmtl+jm23DpOcUC7UBz2W1+TvnrhPR+
 MKu8pPKAgsE8AI5uwCcNJx7V3bczYkIGaXybiEYEGBECAAYFAj/bCNIACgkQk1JW98G3Tko6
 3wCfZBpZAUhUz/Rcp2rfg/YSKl4YLlEAoJN7e322OvHc2GQ9n1+tKLi6Og4c
Message-ID: <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
Date: Thu, 17 Jan 2019 22:23:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
X-Provags-ID: V03:K1:JzXQiyj7YoQP1D+x4rOh+bnzN5vA0b6sOATJ4t+/KoaotmlZ+A5
 Zd2VLxiKn3vmQnKpxgP3YXQ+tq3r7Q4ynH//PiNuInNn5cGyfcxnRa2tX9C3Kl1QpSUAo+s
 2O8bHuID63Tn7S4dFHljjtMwL00VHYhMd+R0Mlg8Vf7YGKTqEKa2RR+i4/qNKJ4t7dErq45
 b3JfYXprFU/4cGb+y27Lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JkEv7LX2id0=:RuQXAXsDjE10P+cdJBDcN9
 Xifsrw0OiLZNTT2NLlx6tDYYaQ3LHEDmVaYwP/Siv3VLXFz7mfHx3I8s7H08XG1Aj3yz5PMgi
 COUSxKf+R/K5wmI4lS1oAmY0zLr/Xof4tBVmCqJ6H4UjNP3+72QChhHIGBxecElKSoAGtKbnB
 KJtHOsmuX9OOrFsjv/BkWRCjVbsNxkHjgx6t4t5gRtbqmpEfumvCgVDzNRQxUA4FQ1sCtHpNc
 G7Y250m1taQ42TJb4LTUOHiZJZabc83nf1twsstyfTqKon3nI68pgb3AS3sSowqB5f5jcx/ur
 IVX3S97MoGIyk3Q+Z+0BfyHmOzLGsGyDmFdKE5/e8pTtADfMojVW98dwv0Wh25oPAWa9GbkcD
 SKhXE2Lqa95XP7D8aTcypi2ApsXFPDdYTKUA7eLaRaS9h4l/qQJOa3uGV3gLuKiqPOMeRa+x6
 upWSz9X0xTdcJQrfupm1ObuIhtWo6MGSgi9uF0GnCQhRsLLDoalpymiS/O2MIk1kU7MICRK0z
 fkh0Gl09pH+EbaidRju0yR3zdk9lzOi5uHX2Yof3FclLqWn3xpyoFJHu/A3jXK0Jkm4E1uSdH
 Hg7ZL+LYXpw/lafl6AUiZpBafNwJSWSjsOSLDkyZ0hz3/PyfngsJKlZHnRUrQzPSe8igETmbM
 xpWNZASJureBynP2HElKM4Mt+6bfW8pUrTxJHSBaMCAmPUBbyDm63+7aMAs8uMFQ5OLrE+XqM
 00Y2lGI/uv2dDHZMLpppnpuPOovOrc4zezPbTdHDNAAsK60WJWvUFfXBahQDEpaoXwrFgCaJT
 awx6gBwdElmn3FSfWymENaUk3ggTpUW/wnwX9/n23xQII8RMWIrSxf7r94wjMYBL8KH3NYPfG
 AF4JlgUC0ucWTnMj9p9dL/l69//b3vNFV/+NoL56eFPUYfrNZD0NVhBb+Rxbl2DEVOAlPrzqp
 bmTJVQ1qoig==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_132403_330412_CBCC0B93 
X-CRM114-Status: GOOD (  19.11  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am 17.01.2019 um 21:57 schrieb Martin Blumenstingl:
> Hi Simon,
>
> On Thu, Jan 17, 2019 at 7:53 PM Simon Huelck <simonmail@gmx.de> wrote:
>> Hi Martin,
>>
>>
>> deutsch ?
> theoretisch: ja, das endet bei mir aber in einem komischen Mix aus
> deutsch und englisch, von daher...
>
>> I got problems with my ODROID c2 running on 4.19.16 ( and some releases
>> earlier ). the stmmac / dwmac driver doesnt provide the 800M/900M
>> performance that i was used to earlier.
>>
>>
>> Now im stuck near 550M/600M in the same environment. but what really
>> confuses me that duplex does hurt even more.
> interesting that you see this on the Odroid-C2 as well.
> previously I have only observed it on an Odroid-C1
>
>> PC --- VLAN3 --> switch --VLAN3--> ODROID
>>
>> NAS <-- VLAN1 -- switch <-- VLAN1-- ODROID
>>
>>
>> this means when im doing a iperf from PC to NAS, that my ODROID has load
>> on RX/TX same time (duplex). this shouldnt be an issue , all is 1GBits
>> FD. And in the past that wasnt an issue.
>>
>>
>> Now what happens:
>>
>> - benchmark between PC - ODROID is roughly 550M
>>
>> - benchmark between NAS - ODROID is roughly 550M
>>
>> - benchmark between PC - NAS is only around 300M
>>
>>
>> and like i said i was easliy able to hit 800 or even 900M to my NAS
>> earlier. I applied some .dtb fixes for interrupt levels for the
>> meson-gx.dtsi and meson-gxbb-odroid-c2.dtb, which will be mainlined ,
>> but the effect stayed identical.
> good that you have the interrupt patches already applied
> I believe it don't fix any performance issues - it's a fix for the
> Ethernet controller seemingly getting "stuck" (not processing data
> anymore). however, that already rules out one potential issue
>
>> are you aware of this problem ? Earlier kernel versions were all
>> perfectly fine and i stepped ( self compiled) kernel through all major
>> releases since odroid c2 was mainlined.
> I'm not aware of this - so it would be great if you could re-send your mail to:
> - the mainline Amlogic mailing list at: linux-amlogic@lists.infradead.org
> - the netdev mailing list (where all the networking people discuss
> their issues): netdev@vger.kernel.org
> - the stmmac maintainers: Gpeppe.cavallaro@st.com,
> alexandre.torgue@st.com, joabreu@synopsys.com


ok , will do so

>
> it's great that you stepped through various releases in the past.
> you can even help us to get closer to the root cause of the problem
> using git bisect. in case you haven't used git bisect yet::
> - git bisect start
> - git bisect good v4.18 (assuming v4.18 was good)
> - git bisect bad v4.19 (assuming v4.19 is bad)
> - the repeat the following:
> -- (git will checkout a different revision and ask you to test it)
> -- compile, boot the kernel and test whether your problem still exists
> -- enter either "git bisect good", "git bisect bad" or "git bisect
> skip" (for example if the revision doesn't compile, your board doesn't
> start with it, ...)
>
> git bisect will output one commit which is likely to be the cause (or
> at least a puzzle piece which points to the root cause)


the problem is that i dont have these kernel sources anymore :-(. but i
can provide some testing and numbers. maybe i dig if i got these kernel
configs somewhere around but i did not change much during migrating



im using a zyxel gs1900-8 switch and a qnap ts231p , and as i said i
didnt change my setup. i was able to hit 100MByte/s from my NAS , so
close to the benchmarks of 900MBit/s

>
>
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
