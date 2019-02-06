Return-Path: <SRS0=Dt7e=QN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A78FC169C4
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Feb 2019 18:05:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAD320821
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Feb 2019 18:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOkHkzcE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AAD320821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MD+VcmFZXIMCNSZCihcDUdvad+8HJ2MqwxhaTEtrS9c=; b=OOkHkzcE+Rcq0F
	PQNvf5hPG0C1s2SKM3mT8QD7+uaWjsL+BhRaC5QK7N07vtTbuswcAGSMpRd/Nq7+R/py+QaxdJMCh
	w+soSGS8K94a6mzDBgGxqu00VqzO2RltppN9DtjsnvTeDM6uDVobyGj2t7T5AATcwY+ekiV4S6xmU
	o1OQeH94qDVrwpJY4J8Pi8F1vI62CLXgnh0IIiV0va+cgh3iFDfHmoIcDqokJhh19v+qpG1nedDwP
	8NLjvPwHY5TmTniGjBnLQ10Z6eFDp7ctM5wYIYwbC7DZ8eaW6yUys0AIe6chETKe/xLaD8GAx7rIU
	LNNP8Z7A9yPT18tbfnfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grRZR-000083-Tz; Wed, 06 Feb 2019 18:05:13 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grRZI-0007Q3-Oa
 for linux-amlogic@lists.infradead.org; Wed, 06 Feb 2019 18:05:12 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M2tXS-1h9nvr3nGw-00shcx; Wed, 06
 Feb 2019 19:04:58 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
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
Message-ID: <29ba11dd-d5fe-592b-fde3-66b5d8626e1a@gmx.de>
Date: Wed, 6 Feb 2019 19:04:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190206103645.GA2482@ingrassia.epigenesys.com>
X-Provags-ID: V03:K1:YCPPc27Rvto5AlftKLBGymFoeDprw+iwK6R4bixsKTYJLl+M/YM
 QnjcGyl+4oByA6j4IjMtlwOXKMx2hIWI71uBrHz/SCOPcZW87fgNlPqUx3aDSGSISQPwSmu
 jowkFr9b2vh1VNeN4WLKefLq+Jg0ZpIZTgP2HlDUJrjP2+jEf4JM/yNWz2u7W4Wj/fj8UFH
 f1KSElYi3uoQVrK6yk/yw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y/9g6tsd7ss=:MAyrigMHZFkoLSqMRxr8Db
 tXutVyxtI6cMakJvlamwCvQ2NwFZ6tz32VB1L1bYet0HzudCH+wFSnRDdW/6ICCxQSvZOBtQx
 If67p6i6GYe6eAuIcA8XjzxQ1ItIRFRpOeG8qhnVBVs938Og707vPPDhMPFKCauYk3hHuBN+u
 X4+qDNR5bDCxYhGfb9gn3alp9uIA3Lkh3myhAWH6fMbld2e1uohDENSBgTs/7+07tsL/n388U
 Qb3vpS4Vdtw7SOY26ndERjzpkEMBjmnqLjh6PfQeonRqSKMOHtVqHVELbahSQZ25PgEw5imR3
 tnggVLlOZAwRbzZ7WG7D1bamv+hvRfoO+psArqiocKGHacKMCp12symbd1iSnMMiFbA/BLE2k
 IYCj6DA5pRbVn/bkJdF09r0+xVk+GU+sSNrCSXpYupOPZL2kA0DmcKFgdDRmA7rfZatK04t/n
 zycfBU0O0bqqWHg7ViKFaHki1JtVu/a+GAHrvwTxwOdG7aRdFvQvq3pIUrypNh7OSsNURKCT3
 9UEDdQeI3M7XeSni8Qwx4r96FA5SfzwUi+ibBJ0M1dQfRAHHyiUKzXzaQ7yG2yhJl/dfjwF2q
 L7rkKVUet5y1WVWaOrGRXqsFs3CGlimsYs9mH7Y6g0kX/hD4ApJY2WrNQyGJStP9eVoOFCRMB
 RCJlxnGzJHX9Tne3XAGEDX9u4guQ4/GUugGeb4wO2Nash/+vsAN/dZySmlhYslVDXuZ7Utku/
 g7u5d5c51s43RDtTyLOotCZLPZ8wqMKZdWXzNucQjj6M+dM8LPUCpjfkRcHHQ7MGVqqsWgX2C
 GVCetXBBG8fmK2Wr/6ZuyinHzIB2FVlaBSo40A5u1LsYFFABD2EJyiWJhTxedMpQGLfX1MzqO
 rTKP0AnAEsrUlHhb4k9bacoY0AQRZzk3LpG1Og0GhSXeJNCM2vw0gQtdRupvzRxWJ2SubkKWY
 0ffntd9L6GA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_100505_250251_B87C607D 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,


yes i did reach 900MBits . maybe it was kernel 4.14 or 4.17. The 3.x
series was also ok.

I will pull latest 4.17 and test. If this doesnt work i go for 4.14

regards,
Simon

Am 06.02.2019 um 11:36 schrieb Emiliano Ingrassia:
> Hi Martin, Hi Simon,
>
> On Mon, Feb 04, 2019 at 03:34:41PM +0100, Martin Blumenstingl wrote:
>> On Thu, Jan 17, 2019 at 10:23 PM Simon Huelck <simonmail@gmx.de> wrote:
>> [...]
>>>>> I got problems with my ODROID c2 running on 4.19.16 ( and some releases
>>>>> earlier ). the stmmac / dwmac driver doesnt provide the 800M/900M
>>>>> performance that i was used to earlier.
>>>>>
> Simon, did you ever reach 1 Gbps full duplex speed?
> If yes, what was the kernel version did you use?
>
>>>>> Now im stuck near 550M/600M in the same environment. but what really
>>>>> confuses me that duplex does hurt even more.
>>>> interesting that you see this on the Odroid-C2 as well.
>>>> previously I have only observed it on an Odroid-C1
>>>>
>>>>> PC --- VLAN3 --> switch --VLAN3--> ODROID
>>>>>
>>>>> NAS <-- VLAN1 -- switch <-- VLAN1-- ODROID
>>>>>
>>>>>
>>>>> this means when im doing a iperf from PC to NAS, that my ODROID has load
>>>>> on RX/TX same time (duplex). this shouldnt be an issue , all is 1GBits
>>>>> FD. And in the past that wasnt an issue.
>> +Cc Emiliano who has seen a similar duplex issue on his Odroid-C1: [0]
>> (please note that all kernels prior to v5.1 with the pending patches
>> from [1] applied are only receiving data on RXD0 and RXD1 but not on
>> RXD2 and RXD3)
>>
>> Emiliano, can you confirm the duplex issue observed by Simon is
>> similar to the one you see on your Odroid-C1?
>>
> It could be but, if I understand correctly, Simon is limited in
> speed also in half duplex transmission (~550/600 Mbps), while we can
> reach at least 900 Mbps.
>
>>>>>
>>>>> Now what happens:
>>>>>
>>>>> - benchmark between PC - ODROID is roughly 550M
>>>>>
>>>>> - benchmark between NAS - ODROID is roughly 550M
>>>>>
>>>>> - benchmark between PC - NAS is only around 300M
>>>>>
>>>>>
>>>>> and like i said i was easliy able to hit 800 or even 900M to my NAS
>>>>> earlier. I applied some .dtb fixes for interrupt levels for the
>>>>> meson-gx.dtsi and meson-gxbb-odroid-c2.dtb, which will be mainlined ,
>>>>> but the effect stayed identical.
>>>> good that you have the interrupt patches already applied
>>>> I believe it don't fix any performance issues - it's a fix for the
>>>> Ethernet controller seemingly getting "stuck" (not processing data
>>>> anymore). however, that already rules out one potential issue
>>>>
>>>>> are you aware of this problem ? Earlier kernel versions were all
>>>>> perfectly fine and i stepped ( self compiled) kernel through all major
>>>>> releases since odroid c2 was mainlined.
>> Guiseppe, Alexandre: what kind of data do you need from us if we see
>> the speeds drop (in both directions) when we send and receive at the
>> same time?
>>
>> [...]
>>> the problem is that i dont have these kernel sources anymore :-(. but i
>>> can provide some testing and numbers. maybe i dig if i got these kernel
>>> configs somewhere around but i did not change much during migrating
>> do you remember the kernel version where it worked fine?
>>
>>> im using a zyxel gs1900-8 switch and a qnap ts231p , and as i said i
>>> didnt change my setup. i was able to hit 100MByte/s from my NAS , so
>>> close to the benchmarks of 900MBit/s
>> I typically only do small transfers or I have traffic only in one direction.
>> thus it's likely that I missed this in my own tests
>>
>>
>> Regards
>> Martin
>>
>>
>> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009679.html
>> [1] https://patchwork.kernel.org/cover/10744905/
> Regards,
>
> Emiliano



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
