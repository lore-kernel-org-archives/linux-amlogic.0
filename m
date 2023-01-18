Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA463C32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBwUA0GW3iBbv8OzDC4AwqmCZhWh3bJqcQlYJzZXOdU=; b=Y2qR4d9j4ztBO7
	si+jEM8Bbe3UAJesa3/s8V42OMHzXJm493b3PYB2FkfG0894ZTrHHaVBly3sAuiuqJjrt7iGsKI8M
	ZDyzsG5QqbJ4dHwkYTlKL+kvFrCu38r0fHdo5/UVRsBZom04i04Aiby7J1dT5/JyTKFQOwVxn4wh6
	zxlnf1ouEFiaqHpAfdsYP9ki9hZTxe8E1FWYj6ymFy+1jSNN6nEN2dEDWc+nAFevh6EElLYD4l4zM
	gl516inZOmi/oTRhEXXOcj706Yb4WWyfZNlbdtxpKoIj+ymrSd1T8F+de0dFrHRxWNIKzjWxnoXNL
	ED7F4C15Wcn0ud72y2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICDq-0021I3-Pu; Wed, 18 Jan 2023 17:27:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICDo-0021H8-En; Wed, 18 Jan 2023 17:27:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0681E61786;
	Wed, 18 Jan 2023 17:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DE8C433EF;
	Wed, 18 Jan 2023 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674062855;
	bh=uDW6T4UAwLieiCNlFUU7aeakTgyrS9giIWSwOWtoE1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kt6ytfZiWMF3EaPKpYmFO/akC9Flz8suAVqfF/tHjqi2SozMlhQd82XiiGX72tsVv
	 WmkfNaT8KKFouxL1Izu/ot8OqE99R+kROeFWwLDq6jPMgPqVGXmk4KDDrsKVBeggMA
	 bFsJkX99Yf/li6plHTOPrZ4Z1uL5mlHeXOyOk1TJdqDubpNM2mRHi97/xUt4lEOFxL
	 tkckrJw+OE2xQkALWG1HApB83AEVpAdc4GZ1s5vePMi/Rl+F7+tXmJAEnPnJWNajBv
	 usw8GFULmi7zieZs4O54V5vQNfbPvPU1maSAgTMz5ONa+LhPzXH3cn47642pD4mZQN
	 9/Rh7SYLloU/A==
Date: Wed, 18 Jan 2023 22:57:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: phy: g12a-usb2-phy: fix compatible
 string documentation
Message-ID: <Y8gsA98CR0k3pMHQ@matsya>
References: <8d960029-e94d-224b-911f-03e5deb47ebc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d960029-e94d-224b-911f-03e5deb47ebc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_092736_553080_8F77D3E0 
X-CRM114-Status: UNSURE (   8.26  )
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

On 16-01-23, 21:17, Heiner Kallweit wrote:
> The compatible strings in the driver don't have the meson prefix.
> Fix this in the documentation and rename the file accordingly.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
