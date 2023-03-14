Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E3CC7618B
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEmL13G6FM7pfl4FfISk3rBWe1lBrNT8nJfMrxO+b9I=; b=ITqJN1LLp8fcg+
	2RB/qaPSYA7BB+L5LKRK094I4NFBdmtlklqlgUGObl2QI4s0Zh1SfKtlOvAGqkPBdmT5C73bxjuiM
	KMnDExJYws/ISY7uSCeE20AWSpJhd2FcYwIMAHEQRVZyHwK383MwqmQqOx9qnTCyIsICPeK1W3K1U
	7zwCNqYD/iHxVvCYMKVDSMJgajndIRDNrY2vuJ9B0T1c8L7JcajqS21sS472h3Xy0tWZ5ELFBxgdo
	LTihz04f/UShPikSJVxkCEWbEXt6B1NJrXm+WimjKGjsrVcp9ro3sUc+UTROMeivuzxEpXR2jMNBv
	mqxy6tatP+V1mRs3MLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAKO-00BKoE-2y;
	Tue, 14 Mar 2023 19:28:56 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcAKK-00BKiz-0e;
	Tue, 14 Mar 2023 19:28:54 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 13F265FD1F;
	Tue, 14 Mar 2023 22:28:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678822125;
	bh=I8FmdPnM7dDH9PZcltGUQjyy4agraZazHHbaG/8Vggs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=R05HmtKuFnX5q9NAxSi9p8n5YBatv1yYtaOoacnekLXwP3JQy/3vPmhQLehD2x8Xs
	 +QVucbtN+RfX95KtzIoSCklc8yGutxcVwqBc6+Z3AfAlv0J2284Or3FD32GDOJqKCX
	 tKglCJVXvXHalqvN3xxCXZ/HBTV5GG4ZEDat86g07YRjqDSJGNJaihlKR3oYyhxz8T
	 u+BTnE09q5nboslp1vPbUPWXWPzNI/QVfkR7EJVlnjga/+l/FuOfBdGqCdgmwt7U7L
	 ugF6jwsIAPhWxdOHfdMlXLp7VADW3/p/iJdVoa3qNGURRy3CmlcFzL2+8isWxhwGbW
	 i+4AlhRsymjfg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 14 Mar 2023 22:28:43 +0300 (MSK)
Date: Tue, 14 Mar 2023 22:28:43 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Message-ID: <20230314192843.ajjfzkn4lxnmjxhc@CAB-WSD-L081021>
References: <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
 <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
 <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
 <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
 <c8fecf94-2581-6cc9-955c-324efdc7c70a@linaro.org>
 <21add21d-4afe-7840-6c49-3786f82761d9@linaro.org>
 <6b7ae52c-d84d-8d08-139c-5c67ec363e85@linaro.org>
 <20230314155641.6iw5vgkrrqcx22n6@CAB-WSD-L081021>
 <b9b4d33d-f325-6437-4f4d-f051d2455e2d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9b4d33d-f325-6437-4f4d-f051d2455e2d@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/14 06:01:00 #20942017
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_122852_942892_E17C050A 
X-CRM114-Status: GOOD (  24.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Tue, Mar 14, 2023 at 05:37:04PM +0100, Krzysztof Kozlowski wrote:
> On 14/03/2023 16:56, Dmitry Rokosov wrote:
> > On Tue, Mar 14, 2023 at 04:40:19PM +0100, neil.armstrong@linaro.org wrote:
> >> On 14/03/2023 16:37, Krzysztof Kozlowski wrote:
> >>> On 14/03/2023 16:33, neil.armstrong@linaro.org wrote:
> >>>>> There are many ways - depend on your driver. For example like this:
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-exynos5420.c#n975
> >>>>>
> >>>>> The first argument is the clock ID (or ignore).
> >>>>>
> >>>>> BTW, quite likely the problem is generic to all Meson clock drivers.
> >>>>
> >>>> This issue about "public" non-continuous defined was already discussed at https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
> >>>>
> >>>> I don't see what's different with this one.
> >>>
> >>> So you are aware that all undocumented clock IDs are still allowed to
> >>> use in DTS and they are ABI? Changing them will be an ABI break.
> >>
> >> Yes of course.
> >>
> >> Neil
> >>
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>
> > 
> > Sorry, guys, I'm little bit confused.
> > In the discussion pointed by Neil not-by-one-increment ID with public and
> > private parts are acked by Krzysztof due to explicit explanation in the
> > gxbb header. Have I to comment out my situation and stay it as is?
> 
> I did not NAK your solution here. I just pointed my usual remarks that
> it has certain outcome and minuses (undocumented ABI). But it is OK.
> 

Got it, thank you.

> > 
> > BTW, I think changing IDs value would not affect logic, because
> > it's not connected to driver logic 'by values', but 'by constants
> 
> You cannot change the IDs, neither their values nor the names (with
> exceptions). IDs - so the numbers - are ABI.
> 
> "Constant names" - I assume you mean the names of defines - do not exist
> after preprocessing, so also not really relevant here...
> 

Ah, you mean the situation when dtb blob is old and module or kernel
image is new, so ABI is broken. Yep, agree with you.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
