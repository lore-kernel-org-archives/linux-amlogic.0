Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97D9C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 00:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:To:From:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyKkhWbKS5D6cHttDHAv1ybWmvUcLINrzwm80F1rp7E=; b=uZOWCqOtXV5RMb
	0+4WB/lXWoIUWqIlaY8E3y0uStmR73uQQN6FT56NuiGtHGXJPdBZqaP6xil168SkTid5PkpvGiuYB
	/NoLZV4XjC5xeOx/LzC05hUFd0XkYuciW9+a2z/pxe/y6DrUg9+gJDvfv05narv1dNZ7GXkApVUZu
	LlfTOREiNQXMqkORhbDh4C6bPlzP22zMg98QvbLznOT05g26qXjZpg3Ze2gV+hc4N6Hw69SFwIPlI
	h89uGC8Nx10tYojT2LKgncgWm9ysAGiMMLuZg4dnFEYKzbwg/Orxsb57ZBuYasMRnmbbg0WCuDrVC
	TASQeq4dLX3q6joXy2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG8U5-006Uo9-LZ; Tue, 26 Jul 2022 00:31:37 +0000
Received: from out203-205-251-59.mail.qq.com ([203.205.251.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG8U3-006UnG-35
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 00:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658795488; bh=tJTFfS52mY6ZQ0pPAfIqFD/u1tEFZCruhQ2+pJXTXT4=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=A9Tvl4SvXxMR/ZPjnHK0U5c6H7HD9qVMjQ5SbhwSZYHEE2kXTxjpFwhvTbaCvrW0B
	 mV4G+MQu24Txe46fMxUpWGKNUx3VPiCOHsi0DBYxzEhqvuft6b5w/eUVMOrwU7zFt3
	 +9XD6JdorDcXQ+pZa20tQJvbL2H+qMoTai8zRxL8=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
	id 7D897E33; Tue, 26 Jul 2022 08:31:24 +0800
X-QQ-mid: xmsmtpt1658795484th5oqgqpm
Message-ID: <tencent_D4DBBC49534ED036FC19485DB48F05B6FF0A@qq.com>
X-QQ-XMAILINFO: NvH2zBBgt3uTV2mey/3w1Qh1F2G4VZlUwftdas+zcS7coPVWPbxTJYj4j0j0ee
	 5Wy/5MtZrpBCmHN9dvtQzu1szHMU4rSBNoX1fTnIgWQwFVWTWXtCMP81k0G8XgYJul1CX9xYqXPH
	 P+YR7Xxx15KPhgIUWwdLYSCkHI12k2/PjlNQoLVD6h6EVE1iFG1eNg5NJCxpgPnZPuz4js6hPlmB
	 pUyMjtKF22UO8Y/V3B/j+dlpOECzYwZCga7eCeMb57CQJ+kG7GMwM9BdScbVNV66eq8NMSXCarKM
	 p136LMzRdpP7gdmneZ4RoVpZzMxFBczfTtF7DGi5TSDq8mZk00yN8nBUHFUCTEdqTRAzI6G6um8R
	 M5OP01+A6PmILZBISM/ADCxJCzdNFlQnNd2W2urfEwzXvB3+kZlPO2RTTPPyyMZh/6kXIbYtoy7k
	 a8LoDxLtRWfahwsbhY3A9hRWb+9ZPNJORxg4SPpg/L4KVMuWaQEKI4K92hDR0d7kTIfSMj/799qs
	 d0xIK2K8QEhzGliO/Gcs7jVNYrMY7PrLbnTAIPU6IyZbO3g46YUKLf/q93BoTtX2/VH6bu92hQFB
	 yOdS8iMEITeMCV+z0fsAYU25AGc6UemLembCaVpFZT56ZXuKtIznXYKTIgeKcXHqGXDJA2mCwtkU
	 PRKtj9Hdfn5uyv3XP9InJ6tmt4fqyCSJ2Dl4VJtoYpsNquRupaoJtb4fztzIWTtmi5DEUbgmmqSh
	 zNpFpXtQ5GqZmWJCQhRMsj1m9JUlvpPrjVMSpQRU9dM4ABKfxY1GvslbT+bntxGuUNZtkR93xM9n
	 d+ksa5Z1PGqwZPtJ1VMDY+ur/bW1QCPYF+sfJzp4mR/YwQtty5keZOVayu9rUB8ekFNLUVinn7wU
	 4pqzl6sAIRFGjHs4QTK+Wb2sJjgQmp1ADlPQ0FarEwHiDLFcf5v+7WK/gP+xHXxQ==
Date: Tue, 26 Jul 2022 08:31:24 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, sean@mess.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [v5 1/4] media: rc: add keymap for MagicBox M16S remote
X-OQ-MSGID: <Yt813EW8+5abLGG/@TS-551>
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_3A0D41063A178C639FED0736A3D292134008@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_3A0D41063A178C639FED0736A3D292134008@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_173135_473043_D29B417A 
X-CRM114-Status: GOOD (  11.69  )
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

I will change the title to:

dt-bindings: media: rc: add keymap for MagicBox M16S remote

next version.

On Mon, Jul 25, 2022 at 07:17:01AM +0800, Zhang Ning wrote:
> MagicBox M16S Tv box shipped with a simple NEC remote.
> it has a key labeled "M", used as Magic key in vendor OS.
> This has mapped to KEY_MUTE.
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
> index d4c541c4b164..6491d1bdbac7 100644
> --- a/Documentation/devicetree/bindings/media/rc.yaml
> +++ b/Documentation/devicetree/bindings/media/rc.yaml
> @@ -90,6 +90,7 @@ properties:
>        - rc-kworld-plus-tv-analog
>        - rc-leadtek-y04g0051
>        - rc-lme2510
> +      - rc-magicbox
>        - rc-manli
>        - rc-mecool-kii-pro
>        - rc-mecool-kiii-pro
> -- 
> 2.35.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
