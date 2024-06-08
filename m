Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AD3C25B76
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOqu7KWpqSWOJFWNgR7Y+7C0COgyFhkWRUFPgnHsfek=; b=VL4+MNBxd/G922
	2H4zkiz7qbELrPAgwgYmYh9hDbUO8iYmsB3BkdjFkgN5uEbjLKHSrar7ypoqg8XcVpvQwRFosd7u6
	9lCc50PKqqfRFt4m/q6Be7JMtlZfQKpPFyrZZbBHVlylE2Bis560m+BSnHcsrQkblySzIv2hBSAXk
	ZfzNlldCCgiX9eF6h8EyR9OcWFYes2tfj0nGTCo1HXAspwn6eZfoBYUPTPsk97H6pW3cehgjQGAwQ
	5XW0Z4hSt9YYnCULdDFMmvXSl8Z2tPiGZ317oxAmX26l07p1dx8JbaGhVTKVPIbYgpBJgyIG1fVdO
	nX2A13Owwqkf/yJdtI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sG0E5-00000000UlP-1OiF;
	Sat, 08 Jun 2024 17:51:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sG0E2-00000000Ukt-1JnX;
	Sat, 08 Jun 2024 17:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26D7B60AD1;
	Sat,  8 Jun 2024 17:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE518C2BD11;
	Sat,  8 Jun 2024 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717869090;
	bh=e1fsE7fB4ewFPaZ8JWr2CP9i5TSif1c3QeBzFO8sI1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fTxP8hL37N96nCLipmzp1T5UNqthOLzfa0wl3ZlHVKHF/l15hlxKLiGIBKHAObd9l
	 1/IO2wBZ56/Dv3HKkw486Lz6x0Lux4JW5tHlytd/U1ZMveZ3k2xUjtU1rN/Ms6g5mp
	 G0M4Cyr+mgB6hUqQfIfZhtAB7eUumdUsql6mgLFMi0dcYeyDDMqLjTigfWgSHlgo/y
	 bbHmucT0RJbEVoOpmNml1Iv1FwUZnRLQguCA6Kv71xQXLZWHMz5cg6OUtk5r/oDfrW
	 HcjDOkpqpbRjlR+K9dHHa/OmQovecXU19Hiy30LVgFTnZSJ1bBUDDxs/iVxSG9ngwj
	 YvuKNwX4rKWTg==
Date: Sat, 8 Jun 2024 18:51:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: add
 optional power-domains
Message-ID: <20240608185121.31a40d62@jic23-huawei>
In-Reply-To: <20240606-clothing-deceit-910ad6aebe1e@spud>
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org>
	<20240605-abdomen-starch-4fd4d7ead431@spud>
	<1a82eeb8-bb95-4fad-acce-798ba0cda170@linaro.org>
	<20240606-clothing-deceit-910ad6aebe1e@spud>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_105134_479229_8F8431B1 
X-CRM114-Status: GOOD (  15.40  )
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

On Thu, 6 Jun 2024 17:21:17 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Thu, Jun 06, 2024 at 09:54:22AM +0200, Neil Armstrong wrote:
> > On 05/06/2024 18:58, Conor Dooley wrote:  
> > > On Wed, Jun 05, 2024 at 11:37:08AM +0200, Neil Armstrong wrote:  
> > > > On newer SoCs, the SAR ADC hardware can require a power-domain to operate,
> > > > add it as optional.  
> > > 
> > > What about the older socs that don't have power domains, the property is
> > > now usable there?  
> > 
> > Old SoCs doesn't necessarily have an associated power domain, or was handled
> > by firmware, does it harm if we make it optional for older ones as well ?  
> 
> I mean, really all of these devices have a power domain, even if the DT
> doesn't describe one as it's hardly gonna work without power, so the
> commit message just seems odd to me. I don't care enough to ask for a
> new commit message though.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
