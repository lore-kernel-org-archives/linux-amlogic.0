Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A8DD3ABFA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2024 22:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zk8tVECt3zXwM/oFbEYdawQVHa0a8cSwKQS5UDK4S4E=; b=o1M0R5XxYgW8lx
	84Ml4khYTQrmQe2S69Zuo6Op5uGyjcbs1mBjJKqlmH7Y1FIZB3lkBZne6b8ZalM8YhVT2sF/xcnm0
	iN5czwJvGYVVcx94VBdsWndgv6UQ74LvGKctovHiJ6FzQyBG9o75/EheXEBASI7sgwIr6RnlFRLat
	utk6yfZ8I10L21inVXbvT0E6LGzA8IttEfgOxiMSGQnGZoYfaoY0IiIjDCHYBo5YeyaVdYDPSKURm
	hiFajH7OQV1BQDYi0QxVGKHn7mFaWntotVDJ8Xydu69KkrUseDyebBnlIP3xqdNpQibdYB+H7IZz5
	1TxpN4WjLzI0mJOSTzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcTx-00000001R89-0Daa;
	Mon, 11 Nov 2024 22:02:01 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcTf-00000001R5k-0R0k
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Nov 2024 22:01:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C117F60004;
	Mon, 11 Nov 2024 22:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731362500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nkufrg1CIcStL4h9DucTfQMnDSoYDhL3Jsv23vGuCsk=;
	b=S+NkZEajDuG6zBcnK3ptlSHVdU+OypPAL3PdOQoCyMCzyda2/w192sjHngV0gZOlio25tb
	sr/CW3ncCm1DwbW3+An8VLTDd0UKVGEKz3B1tcLzzJL49Jyka2I6KhmaFVNMQBCyeLrwy/
	2KqyPwZGSzJINa56cgEw1bu6aF7DCI24/GMTXWFpN3/ZBeaei8BSMRIcABFa7sYv5x9hyk
	hPWFDMbqC3HZNj8HXPdNbCdU4DPuGsLmJ/cVJfwfyusgJcScqw63IJvt63+t4DK0Vrwvhh
	I2Wt/Tix9L3JABONOqPJQHSmMDwpwjFGfJlRzJh+KGZYWdKCCVoE+/QwleXa3g==
Date: Mon, 11 Nov 2024 23:01:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 0/3] support for amlogic rtc
Message-ID: <202411112201331e47986c@mail.local>
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
 <173136163495.3310623.12434068921554307587.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <173136163495.3310623.12434068921554307587.b4-ty@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_140143_303224_42513A14 
X-CRM114-Status: GOOD (  10.48  )
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

On 11/11/2024 22:47:51+0100, Alexandre Belloni wrote:
> On Fri, 08 Nov 2024 13:54:40 +0800, Xianwei Zhao wrote:
> > Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.
> > 
> > 
> 
> Applied, thanks!

Actually, I dropped them, I'll comment on 2/3

> 
> [1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
>       https://git.kernel.org/abelloni/c/12defbf1429c
> [2/3] rtc: support for the Amlogic on-chip RTC
>       https://git.kernel.org/abelloni/c/db26c3d6eb01
> [3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
>       https://git.kernel.org/abelloni/c/cf6f2ddfd039
> 
> Best regards,
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
