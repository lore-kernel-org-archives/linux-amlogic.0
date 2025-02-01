Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D13C0218A
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Feb 2025 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tJChNYvT1dxrPvXVdOw4Qaj6znoC5YucUL5+J2RJig=; b=RHErWw9ofKlJ3r
	XYoxHuv0sLJsVMx6OjJ8iEXIRYO2XhOm/fSVgUYhmTRAJAKh9pVAI/wysnoE2pifPm71Rlzj11TQQ
	4wcv8SLArJHocn89LVyBo3590LUIPuwCIC/COaI3G2nFHOgCcTdL+6zSowPxvGyZ2dBL1lk1XXdhY
	6I57uZ0uBWtmV0k60rPAnqwPHoSlk3tbnbSarSDmeFNLOLVNKN1YVRrWEBv3Mvcxtv7tEWo92pz6Q
	nhq3sh72OlxCBjW1mZ5KucyOYn35xv46NAS6n/ydKQrk4XLdAxGQJN2+V9u0xb69cG8/rSd28+GdB
	sQNmKMYF+TW9Tr7XBVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teAWf-0000000C7u2-3BOX;
	Sat, 01 Feb 2025 10:14:57 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teAWd-0000000C7tK-0K2k
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Feb 2025 10:14:56 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738404892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96rZKH5baF3RIgzA4V8zMqp7dM/6uPD7zsmS9yr/NDE=;
	b=IbDdiCn74N1qJ6m4LzTt+CYPP0D5o2at45JhSgscXm/m84S9+RKvJ4hLz/r5oG8cugk5vA
	/ejbgNK8RFTW6XoafI3gJJwuYefXYgJhnGXDXPS3nWb3HGwpVsaMYz1+89uGtdiCI8DQZq
	ma/beqUPeM9aCii5Ht3h8HhnU1MKrXoB6PkDmKADjwBO7vfrYTEK+eMBNc+zVpShlgcx0S
	62KgtcLg8Zk0Rr5x4qJPWPk4oW5Po+FHLg+xwnajhzX99bC6MWp2O+HgKFVcslWNAqSBmk
	c9bHqfjtBLXueorjXNedhQwGp7puGZPpGgkI7l8qKxJLeTRszp798AwvSYmFVw==
Date: Sat, 01 Feb 2025 10:14:03 +0000
Message-Id: <D7H1348E1P68.3JUDJXGJYILFS@postmarketos.org>
Subject: Re: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>,
 <linux-amlogic@lists.infradead.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <devicetree@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Kevin Hilman"
 <khilman@baylibre.com>, <linux-kernel@vger.kernel.org>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Artur Weber"
 <aweber.kernel@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <173835855352.46011.13506160179490240246.robh@kernel.org>
In-Reply-To: <173835855352.46011.13506160179490240246.robh@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_021455_241565_C2929EB6 
X-CRM114-Status: UNSURE (   5.26  )
X-CRM114-Notice: Please train this message.
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

Hi!

On Fri Jan 31, 2025 at 9:23 PM UTC, Rob Herring (Arm) wrote:
<snip>
> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: pwm@86c0: clock-names: False schema does not allow ['clkin0']
> 	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml#

I don't think I touched that bit.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts#n279

> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: leds: led-white:default-state:0: 'heartbeat' is not one of ['on', 'off', 'keep']
> 	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
> arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: leds: led-white: Unevaluated properties are not allowed ('default-state' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

I'll fix the rest in a v2, thanks!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
