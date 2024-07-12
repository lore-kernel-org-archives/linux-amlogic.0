Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C28FC3DA4B
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 12:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpFxuVYEA6J5AhcLJFevyFRQPj/XK/qozAJ2ycKGGIg=; b=gmvRqa87xr/gJd
	ha4qUgRiTBoYbGNY8H9xEJnVOk8+F7aM4M6I+wRE4vEYYScy3pNMi6D2i08XO1exy10RxssF/wibJ
	lKW1a8H+lIcetj88+EmlMCAsw5gQrBzZq9WvLx3obpNZQ0sAXEiPdGO+rxNeeBaEp0OHrUASdiGAb
	lKMi1Y3kozpq9NGbnLGzWA4MhOXD2VMEgL+b9ubvD9TN1JBDPf9OcbRZ01OHQKB817wllHHGV0TYE
	f3JYGc6ndCQTuUQIh64DRS2qtLdY5hdMzR0kLwfog5IO1RklXi7i9XStUEyzgXutvc8672ru2bEUr
	5kj2WNJ3sfkNpV9WYThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSFlA-000000002hV-3P4b;
	Fri, 12 Jul 2024 12:52:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSFl7-000000002gh-46Nk;
	Fri, 12 Jul 2024 12:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E49F61EEC;
	Fri, 12 Jul 2024 12:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5C5C32782;
	Fri, 12 Jul 2024 12:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720788740;
	bh=K/5xWWbqZi9trgeRZCDyR2pMp0A5m1JDTg3308v8IQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLlcjMkp6NfuCvjZuu4UGlzFjaStGS356nHf+0YdpSSw8EZWAXD8u2e1RMK2Nsn8X
	 ypZeUVVY0IS3d9VX+m8Z2acna0W1jwmmAmiqes4ZJrU7yoRPE3cX9gqHNBtxNnMOwq
	 5pX1bSQSePaT6csyQ5vOrcZgVoQYf1JmyhvLYPC6fp/g/vcnlkBAPxhuSRjDKZQvkr
	 N17c/9XtwLY2hjLIPlpYy/B1isXEHCYb6nJb1y6BuBzgmFqjbjmHFmUDyYAwmxk4a0
	 2f/fFp7lKVyT8sdVEO3zKtzotAZwqoEKiRtbpNOVlDPe69PLsrTORzhFlFVquiEGL/
	 Z+gSn3PLa8N9w==
Date: Fri, 12 Jul 2024 06:52:19 -0600
From: Rob Herring <robh@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: ukleinek@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	hkallweit1@gmail.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 PWM
Message-ID: <20240712125219.GA472311-robh@kernel.org>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
 <20240710234116.2370655-3-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240710234116.2370655-3-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_055222_076979_296DECFA 
X-CRM114-Status: UNSURE (   9.07  )
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

On Thu, Jul 11, 2024 at 02:41:15AM +0300, George Stark wrote:
> The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

Missing ack from Conor. When you submit new versions, it is your 
responsibility to add tags.

> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
