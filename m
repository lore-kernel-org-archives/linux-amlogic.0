Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058C5C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSX7RCEf4N+Jo+x5grJh6qXVsGDePV9o44Gm0tIF+J0=; b=nRhAYapCGCQzHZ
	MhbBsb56ghrB1b1pOGqVXXg7G/frfENs0suFIsseD+2hmXUxKvzOKbI5V868mWKiUg5V8PRiN7NDv
	u1HjkW1l05Q/aopnduKzgUtVsmofhCEVWU/dPuTZL+fuo838Ms2Kck4ORV1KHEpEVCiAlG4gHl0zW
	RxtcWHsTeNMTchv6/NywHp6+mLRLJj/0JmcVcVPrUEDDshk0JstIlOAc28a+ixjAC2gcEQsVwP/4t
	v4gYlqMwHD/Yj1KB22pUM/ftv8Bg04dXru9TWpf+hE4pdKZOv0T9YbW6oSMleh/oppIcLTXxz4s0E
	svx7LiXyR8sxlvRemZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7dFm-002XB4-JO; Wed, 12 Jan 2022 13:01:26 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7dFj-002X9m-QN
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 13:01:25 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso11879339pjm.4
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 05:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vxuJ0eKUOzqs4BL3RXGtwRzHjP1ztp6I2cQyliBQvTM=;
 b=Lk0W06fl5Vk3upcZ1EWLPcM3OFdn+socWYkb5IOG1Env3+FN9hjj2qLQ4UG4FArLzq
 wkk025S6sO2GgaLwvzk0lDvfv9gbXwMliCfglmXilU9ww17qtoAFBY04Np2TP2Go1vWZ
 x6uzZ3xQf6hvJPLTXIMphSm/adRYLH2vJuVTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vxuJ0eKUOzqs4BL3RXGtwRzHjP1ztp6I2cQyliBQvTM=;
 b=sbwSNOUeN7HxI3Zg1OlYHOuB82yH1ZkYt7pExcliryKuTOEdKEx1bAGShcc+UcCjmj
 QTQRetEjjbfm4pcQFDRzfoQJlUOT5Co6kJsfi6hb6tljQCvmIdodC3yzCGP+SpdF/eW/
 3PuAcqwyNIeuTdyiRHdqXGLIHUEaJ3SAVRgEryNQ1syg/qzcvTHWXZz8hOEZsqHukeS7
 ThBs+sYJbF7jM5rV0vsvnuu2Xaj7rMyS8enfwfY2HhgHc4vA9rEFPUYndyxM/HPhgv4D
 4qsP+t/0oJpV2jdfPCokRwoCVSTaEu2WLxZyf+SuabDnpMg6Zr8hFNijiuCAANNItb/u
 stqA==
X-Gm-Message-State: AOAM531b/I3JBN73GkynqNqC1GZqkZKajBZ4MWnpAjIP3t2hLmEXGNy9
 fmUuP4hfIuUYR8rR0rtiVsuuxw==
X-Google-Smtp-Source: ABdhPJyLjY0Y/Ke21bvO+pWwfSSXV3kTTGk/pK3WXRsgY+aWMLqvk5tWT6NdISmYx1GUAIPZjR1COQ==
X-Received: by 2002:a17:90a:c917:: with SMTP id
 v23mr8642773pjt.49.1641992481103; 
 Wed, 12 Jan 2022 05:01:21 -0800 (PST)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id q8sm9419877pfl.194.2022.01.12.05.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:01:20 -0800 (PST)
Date: Wed, 12 Jan 2022 14:01:15 +0100
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12-common: add uart_ao_b pins
 muxing
Message-ID: <Yd7RG80hhjZilGs7@p1g2>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220103154616.308376-4-gary.bisson@boundarydevices.com>
 <fe58c139-f127-d102-a6a6-b8c2151aac20@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe58c139-f127-d102-a6a6-b8c2151aac20@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_050123_887789_07B17BB5 
X-CRM114-Status: GOOD (  19.11  )
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

Hi,

On Wed, Jan 12, 2022 at 09:33:42AM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 03/01/2022 16:46, Gary Bisson wrote:
> > - RX/TX signals can be mapped on 2 different pairs of pins so supporting
> >   both options
> > - RTS/CTS signals however only have 1 option available
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  .../boot/dts/amlogic/meson-g12-common.dtsi    | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> > index af1357c48bee..3a7773ffbd08 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> > @@ -1952,6 +1952,33 @@ mux {
> >  						};
> >  					};
> >  
> > +					uart_ao_b_1_pins: uart-ao-b-1 {
> > +						mux {
> > +							groups = "uart_ao_b_tx_2",
> > +								 "uart_ao_b_rx_3";
> > +							function = "uart_ao_b";
> > +							bias-disable;
> > +						};
> > +					};
> > +
> > +					uart_ao_b_2_pins: uart-ao-b-2 {
> > +						mux {
> > +							groups = "uart_ao_b_tx_8",
> > +								 "uart_ao_b_rx_9";
> > +							function = "uart_ao_b";
> > +							bias-disable;
> > +						};
> > +					};
> 
> I'm not fan of these nodes namings.
> 
> Perhaps :
> - uart-ao-b-2-3
> - uart-ao-b-8-9
> 
> so the actual pins numbers used are more clear ?

Sure, I wasn't convinced by that naming either. I although thought
about:
- uart-ao-b
- uart-ao-b-alt

Let me know which one you prefer and I'll respin the patch.
Also let me know if I should re-send the entire series or just this
patch.

Regards,
Gary

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
