Return-Path: <SRS0=JMSZ=QV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D31C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Feb 2019 07:23:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B90222A1
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Feb 2019 07:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZBRrWBHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B90222A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/a4k0o3aDDM6VzfHIYWwxmqGDYfXnx33b+8Gi6G/68=; b=ZBRrWBHVILm7Jm
	U4uY1BY01F4UK80gzOLsfemqkgv/g54TegHSTPTVsk416mt0SWz7vn29ylwL1OB2P5qC3kRmb/68j
	0L/qfKRSLH0HnQMwBYCF6UhQgBGLR5RCwIuh4fGWvC9JHL6zHgMgqWQjxq/3j503rWXSaXajHp05T
	8cyplA5jWLkXgZ7QfGhxASDnehKZP2IK13oOLSHK9fqB3EWI8VfO/y+siOHKSy4zkQACErcJjgskg
	IEQ5p272ZYMdidFqSV6NIkc05j3tUb7n29H8kMCSyuk/7tI9MKaeDPdt2qWH8+GE848fTROLvxJFh
	dRmOnkmv6zrHpzksWwLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guBMC-00071v-77; Thu, 14 Feb 2019 07:22:52 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guBM9-00071V-04
 for linux-amlogic@lists.infradead.org; Thu, 14 Feb 2019 07:22:50 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lw285-1h8Qx42owv-017nGm; Thu, 14
 Feb 2019 08:21:31 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
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
Message-ID: <9c5a09cf-faff-adb8-9be8-cf5c35d3fbeb@gmx.de>
Date: Thu, 14 Feb 2019 08:21:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
X-Provags-ID: V03:K1:tnM8O20RdlFtXiPgKX2sCkWqqXJUgs/wQ9x5SWPCrovHz2Ahb1N
 yJ5pe8tB2glcuEbI1uY+RQcrA1Qfme9FzDB1Gj7yb7dXdzi5uvZFgUbDk1O9PNzvxzI/b1j
 5+at/0y+o0ezw3XAePuzr3TSmZSpQs+IMvx9GORVc543bXH8ENI8eQHKeEPaZn0vvt4UQwF
 2SBFDRPUI1KCZebAe0IpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UZOs8fZH5f4=:7CxHdNGoNtuV0F7rUz7iBz
 6qICFZBrsfRkqDH2CL8TS6hGK4CQ28A6BADSoSa8GAgQXUc3CB+NwjyAESPng9nzaz7w16SBq
 JotaOSGfYZ9T8sT+UtPgl1GImbrUg/KSjCXE/OpnL9fW44sTJgrnm6qzzAfOT5G/kYkbtwtfb
 jgofubrtrhAzwdnDSrAtTB86YvWH05FT91EOw7svI4GYFR4ZB2qYlh6SF6PMSX9bKCcrZ0m6j
 Y+i3z/wLKkVpLyZsa9YBbykm1kLcP04avE/g5V0SuKflJyy8P4Tgl2qEzhnqTzpLPtwQpzIhH
 kabT2rDivNabby4mzGoOO2VN9h/ZEB13s7Nkr03wwTxo9HVytXSf+wXhBIgPp6sTv7a/0qe5s
 IuShxPpOEGKKRkUr4+yEYO+cD2iCffWQfbxqmza9d7M6SqfpSyscoig/KHIZfxNP5nsZ500CN
 6Byxx2NxaIt2hvLbZhfIvVFkgouk1Yo6KPG6VyaLC7U9ZP2k3R7r1USjhDHDu3M7GNXiBQJiF
 7tNXmlAHyZOeyoROrcphHASCLJeoo8/ZR0hp3wE2j2X8Y0C7jQVPLarZHQByiOuCAwlwlkQ3o
 eLf8EWQIaGNvrK+TMqftwHPuaxEp1PT5gsGpzOPKW30wKRrbcU4GDQYb2QOyOoJiBReypKAHp
 5ZjU91WNI/+szWhW3SMXakuW4s5Y/fBKRkiRVngGl5Xe/aTZTwtspJPbRx9SxtglKJ3xWHdD0
 NUbfWJSsiyIsH6yeTjIZbPVJMul9LbsNtdxSpdfFlsa2DOjq6PYVcYdFZjiesRxK+Lr3Nb1l1
 JjISrsxEJVM9w+k5lU2b7he4LwA3zVRcsCuH/Zi1vl53yamBt2HgLGmaWuNDpRV5ZFYgxbsKK
 JP0/psT+lY0nvZ2OWK2BGyGV1zmaqs2fYOH+Bey5JzE/WD6w9hVYS9TRMOJ6A+u0ORBbL5mAr
 mmmGiejOXgA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_232249_341573_EE1C44A1 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

i used iperf2 on my odroid c2 , since this can do duplex tests ! iperf2 -c 10.10.11.1
-i1 -d


Do you really need the exact numbers ?

NON-duplex:
4.14.29 reached 930 MBits without the -d ( duplex option ), 5.0rc5 only
reaches 600MBits there

DUPLEX:
With the -d option things get worse on 4.14.29 , 600MBits in both
directions. on 5.0rc5 this is the 500 to 600 in one direction, the other
only 150MBits.


iperf3 is not duplex capable, i didnt test the reverse option, but
duplex tests show that one direction drops in performance when the other
is busy.


Do you really need the exact output ? I need to reflash my box then
..... if needed i would do so.

regards,
Simon


Am 11.02.2019 um 14:44 schrieb Jose Abreu:
> Hello,
>
> On 2/9/2019 1:09 AM, Martin Blumenstingl wrote:
>> (it's interesting that the sending direction has 445 retries)
> I saw this before and I think it was related with COE. Can you
> please disable all offloading and try again?
>
> Anyway, maybe Simon should bissect ? I think since 4.14 there are
> not that many commits in stmmac / meson8b-dwmac that can cause
> this behavior.
>
> Thanks,
> Jose Miguel Abreu



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
