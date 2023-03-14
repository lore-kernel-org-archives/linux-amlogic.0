Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B02C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWsevfZM5GFhfSNXccaS+PYEWkQsJ1uz0WEWmdZ0SuU=; b=c19ppOPyIT2n2l
	FqJQLO83UHWkHO4GRn3IqWoRGsrsD/q0VHIHciqDe4X8mluj4DqJy39COGeFbkByTcRL1AqpbfJbm
	s6b9fYMsRZI/+TpX/5egPz6vBqq8n9Tbiet8IgJrUH5eqZuibYbqzFDe4tFgEeri4y+1pGr1Z5fm8
	7DuSxDD46mCSDtRwC4nlTfxsC1cU/iA120ZhCehWMCs1xB3vHcXfj50Lc2IWitBR25XyHbluDdx3J
	4fSw4qDMr3GxLG0cljBLKmGSM+780KO/EjnSClbignoT+NxiK89dJCbaFkS2otwfufalxQgnlgS1G
	uAKND1OOEdu71voUvihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc71C-00AhbL-2W;
	Tue, 14 Mar 2023 15:56:54 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc719-00AhaN-1F;
	Tue, 14 Mar 2023 15:56:53 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id F2CDD5FD07;
	Tue, 14 Mar 2023 18:56:47 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678809408;
	bh=wcq5m53ZFK5TVWkcvwsaAEgiVXwUEOH+wnHeJh2ir6Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=cDhRnqXP6EcDV2NsQ3ThWKnGlVknGnlkzMGhSGpUsdMvKR3PmQzUOK2pfP1Kti0bG
	 pupxmjBJ9W+PFosbK3LcEZZVCjRfdpEh//94xKf0xHuyHT4FN3Sp6AGy7QENOeRQ9y
	 MixsRCdylJZmGJ0m43TyAXF0EYSlXBba+B6ayRXV1kJUFxxVmBrlKoSKKFcWXxUQAW
	 YZGB6uSl2KAjJynoSUhKtsCoYzbVsgt/z3q/fqOo1XOoda6hpd4ALB7XVas340yabJ
	 Pi1+IKZYMyYyfccrQ4j1n88dxbxU4a1ycLhJzTE/SkRGLwllskjC1qSWXIBWPqIIa/
	 jZ4N8Xd72UvNA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 14 Mar 2023 18:56:47 +0300 (MSK)
Date: Tue, 14 Mar 2023 18:56:41 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<jbrunet@baylibre.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Message-ID: <20230314155641.6iw5vgkrrqcx22n6@CAB-WSD-L081021>
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
 <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
 <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
 <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
 <c8fecf94-2581-6cc9-955c-324efdc7c70a@linaro.org>
 <21add21d-4afe-7840-6c49-3786f82761d9@linaro.org>
 <6b7ae52c-d84d-8d08-139c-5c67ec363e85@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b7ae52c-d84d-8d08-139c-5c67ec363e85@linaro.org>
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
X-CRM114-CacheID: sfid-20230314_085652_135657_E9D7FAFA 
X-CRM114-Status: GOOD (  18.09  )
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

On Tue, Mar 14, 2023 at 04:40:19PM +0100, neil.armstrong@linaro.org wrote:
> On 14/03/2023 16:37, Krzysztof Kozlowski wrote:
> > On 14/03/2023 16:33, neil.armstrong@linaro.org wrote:
> > > > There are many ways - depend on your driver. For example like this:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-exynos5420.c#n975
> > > > 
> > > > The first argument is the clock ID (or ignore).
> > > > 
> > > > BTW, quite likely the problem is generic to all Meson clock drivers.
> > > 
> > > This issue about "public" non-continuous defined was already discussed at https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
> > > 
> > > I don't see what's different with this one.
> > 
> > So you are aware that all undocumented clock IDs are still allowed to
> > use in DTS and they are ABI? Changing them will be an ABI break.
> 
> Yes of course.
> 
> Neil
> 
> > 
> > Best regards,
> > Krzysztof
> > 
> 

Sorry, guys, I'm little bit confused.
In the discussion pointed by Neil not-by-one-increment ID with public and
private parts are acked by Krzysztof due to explicit explanation in the
gxbb header. Have I to comment out my situation and stay it as is?

BTW, I think changing IDs value would not affect logic, because
it's not connected to driver logic 'by values', but 'by constants
names'. We can expose/hide anything from device tree bindings, it will
not change the clk driver logic.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
