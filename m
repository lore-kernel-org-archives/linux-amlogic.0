Return-Path: <SRS0=/cGg=OX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962DFC6786C
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Dec 2018 12:31:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66E072145D
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Dec 2018 12:31:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OdDehhjx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E2sdjgxo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66E072145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RY9/fFcuAhKtabRWH+LG45Ux8jI05LwwA40BVwuEkM=; b=OdDehhjxtUtI3X
	8mWRIEN5HMBbGb+6CrFtPBo7rCJJ249VVPxFyMMOBb9T5Zxpd8zLNaB8vBE6cTQ/8qxlOberbbz1u
	1jn4hMK6hdxOgMUrItzjgQpI0rCTtZv3OA4vfxigDxzOiQYyX7a7JCOBJhlma9gNzZGS9fSGmoDJ0
	TFAY3jXPl0+c0HDmHiTk6RjdGQN1Z486GyA3KpNxrus4S3wSbpMGIhRhtUECntcaVl+aFsJR7xIy5
	+zjSdMFE2VCoPLFNa3Ek86QQ4KN7obEWM3w0lWGt5hP1i+kBWLcvUX2JB6gtHqrxaCdQyE1ElD/l6
	JtQ1IICD+jMdvNzx1sxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXmcq-0000V7-VB; Fri, 14 Dec 2018 12:31:28 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXmcp-0000Tl-Kk
 for linux-amlogic@bombadil.infradead.org; Fri, 14 Dec 2018 12:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+/2W0ZkjprBP3G5vlj2rU/53t7x1anvFUDYMC3jW5A=; b=E2sdjgxoij9EGaiP6CsNjxWOvs
 spo+IWQQ6NIbHm4IOChyVWRXp8HW+q2ekRRV7QBOgbQ09BjjhU4O2DVPCMeFQ8JuJ9D6AUgexC6eH
 M2oYjO/5P4KDOo8qljwl0pgZF0nTT3BdX4ODAiqriH7HIEHmlN3p0z03oXqY7hJAWvVsawUCcZ1oq
 ykiDRfP0qrmm7EqszaOfMgC15JoMR9GUBxM6j9oW+skIrVHCOe2J1QDS57eaXdQVDogxz7gnWlQ54
 drpopjERpjwPxcSGyDGbjHVQIRtR8F+zInr5Agx09/bIyNNCuSyZl8dWzoPbG7y9Gfjz8rK9VjUZz
 D6L8faBg==;
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXmLf-0005su-NC
 for linux-amlogic@lists.infradead.org; Fri, 14 Dec 2018 12:13:46 +0000
Received: from wf0848.dip.tu-dresden.de ([141.76.183.80] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1gXmLL-0006WM-2O; Fri, 14 Dec 2018 13:13:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RFC v2 5/8] drm/bridge: dw-hdmi: support dynamically get
 input/out color info
Date: Fri, 14 Dec 2018 13:13:22 +0100
Message-ID: <1602894.V8qvSO823h@phil>
In-Reply-To: <20181130134301.17963-6-narmstrong@baylibre.com>
References: <20181130134301.17963-1-narmstrong@baylibre.com>
 <20181130134301.17963-6-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_071343_877791_B38CC587 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: architt@codeaurora.org, maxime.ripard@bootlin.com,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-amlogic@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am Freitag, 30. November 2018, 14:42:58 CET schrieb Neil Armstrong:
> From: Zheng Yang <zhengyang@rock-chips.com>
> 
> To get input/output bus_format/enc_format dynamically, this patch
> introduce following funstion in plat_data:
> 	- get_input_bus_format
> 	- get_output_bus_format
> 	- get_enc_in_encoding
> 	- get_enc_out_encoding
> 
> Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Please see comments in patch1 for details.

on rk3288 and rk3328
Tested-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
