Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96436CA0EDC
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Aug 2025 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44ljy61u+CVDsVDNzM5XN0ySPJgKIaiJszT18lM4N5Y=; b=MqkAE+FQcdvLat
	Aufnb0R6nXY6Yu4IVJJnjkpgBtwjLC186NsM/o5d+B9yXZTgapweEZ30AGsW+2Zazmf7Fc6uI1umG
	YDKrKcXh0Lw0ws7SXjkIhvGAwxao99QH+cqW1AXYI5sYhX/O2uLqYMcpwxKO6tm0SSUCR9bowN06f
	aMSuN9MZJ5HEAgKSzHwELlOqx5OjFM3dcIBvErXe4XH0/Ndugb9UhkG7X0f/NFNcserW6uaA7LIeI
	NiUcifzgvwaR667pCjdWye5JFfDkq6lhXt7DHO9kbVol179r5uPKbErOGcRRgDiHqkGclmykCQXtR
	cAhEFxZjRl/J6hnUSIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoefe-0000000CpDP-13Vz;
	Wed, 20 Aug 2025 08:59:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodwN-0000000CguY-0KM7;
	Wed, 20 Aug 2025 08:13:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79D416113B;
	Wed, 20 Aug 2025 08:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97A8C4CEEB;
	Wed, 20 Aug 2025 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677582;
	bh=CH9L5v4OJHqNF11uvWGznbvo74AYetAeErsKQ/WIsgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U39V5nHDEseiJajLZVfudpRL/MtpIT+/avAlSeh2oaPpigXeGuFJlFtv9Pna+GkJC
	 kNET9eK9bntCIZOV0NDew5F0GzNZFpLDKfHgrV2S/HvEx1rQjz0A0tQf0IZSpGM5/s
	 pvnn1fcJKT4FcYPEf2olm8TjAC1e4yY6P2fZ8SluGuEOueXPI3lnSORQgxvhqfALwc
	 XNsB4pu+l2wzfzeWI6gtUQsCoAC/aS75Ory43kIpRCskfkScxIZinzwVISdWerqWem
	 yTbjFbdJmBoSKt6f4fies/UpbdtFvx2TnExtnPiIFUILzyiDLit7yzWqSklHvh3Nre
	 iqAt5wZ4daSXg==
Date: Wed, 20 Aug 2025 10:12:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] soc: amlogic: clk-measure: Add more SoCs to
 support clk-measure
Message-ID: <20250820-spectacular-passionate-oriole-eaacda@kuoka>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <8e64245a-d7ce-40b7-b884-84a7234c4a3e@linaro.org>
 <673d8146-1cc6-430f-81fe-9e99896a56f5@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <673d8146-1cc6-430f-81fe-9e99896a56f5@amlogic.com>
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

On Tue, Aug 19, 2025 at 11:32:07AM +0800, Chuan Liu wrote:
> > 
> > But the fact you need clkmsr-reg-v2 means you at least need to add a
> > generic
> > compatible for v2 register map and drop this property.
> > 
> > Overall, I'm not a great fan of this, it moves data to DT and duplicates
> > the strings in _all_ board DTs, which is worse in fine.
> 
> 
> If you agree with this approach, I can refine it based on your feedback by:
> 1. Adding a new compatible property: "amlogic,clk-measure-v2".

NAK

See writing bindings document.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
