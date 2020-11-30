Return-Path: <SRS0=GnnG=FE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D025C64E7B
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 11:01:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A6A2084C
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 11:01:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Te2fwRFf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jesh5qnt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02A6A2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EliHO0sHLqJaYOA+0bnxLVCGJVLZl06G2xUETn+yujQ=; b=Te2fwRFf1FHvikRSQiCetIST1
	Wd4f//jaBcBeB/dG6b1DKdn5rDDSbPc/RvOx8G4gpbOWwltr9RPm7K2OM1s97c6juDGg6GbY81F4T
	90N6WKaB3NguIsrndSRjS9SVzWd5iSLzEEddrsJS8JbBenxLum08sLyrwEDGEk4/FJc6ha7Nf4nP7
	yS3xc8Ut+HMGWLHCJ3cZNVoA/Di9cJyfZ9jspJRnDXzCP9SZziNLf8eGpq8KhLPCGjc4kKXh1R048
	0FN7M2k93u8zHCd7BPt6V7fF6u/ozKVK9pTA78z2/t9a7drAZW/Wm4nS0upZ6cC84vd51vurIQqKv
	xK3yNqeQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjgw3-0008Nd-Uj; Mon, 30 Nov 2020 11:01:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjgw1-0008Mz-Be; Mon, 30 Nov 2020 11:01:34 +0000
Received: from localhost (unknown [122.171.214.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E437207F7;
 Mon, 30 Nov 2020 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606734092;
 bh=u2ceb1FjNxP1Dx10zTQidfx6V8dt7vhYLK26IK2uKBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jesh5qnt6HKNiA2NUpIIQdXrXalDtPsfJE3eWCGpv0ZLMI07P0YSf/2S6slY17SPb
 4TXa+2nElExsghiE2/nIwWG6YKwxL5lQSKeAiu3/JcZRI+FyBGVaOXw+buTUf9BoGN
 iMjthMcbzHZsHy+70wAI1BhhHBBzJy94bMJzpL6w=
Date: Mon, 30 Nov 2020 16:31:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3] phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up
 even in Host mode
Message-ID: <20201130110113.GR8403@vkoul-mobl>
References: <20201120153855.3920757-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120153855.3920757-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_060133_478820_7E0191EB 
X-CRM114-Status: GOOD (  11.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 20-11-20, 16:38, Neil Armstrong wrote:
> In order to keep OTG ID detection even when in Host mode, the ID line of
> the PHY (if the current phy is an OTG one) pull-up should be kept
> enable in both modes.
> 
> This fixes OTG switch on GXL, GXM & AXG platforms, otherwise once switched
> to Host, the ID detection doesn't work anymore to switch back to Device.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
