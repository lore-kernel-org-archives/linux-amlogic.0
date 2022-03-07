Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2000DC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Mar 2022 08:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc6X79oi/cT+HAmSW+LLzSKZC/fH2UtslpHbz6XotTA=; b=1BkV1GjBiZTR2U
	mViGaCV/6xNSyXnr8yYGukjOtFrP7J+/eTrQkTl+KxbCoQDCMRgiI5NdJgzlxXAvz9EDIou3rymTv
	/tdjqDCKlIt2h6mU4CjpqFaVHhDsyKizqVJD9x0YmouAm+DkxK9SPHFk/axGzwj8oTCX5th85Hau/
	ZOydVovbCoN4DcNoGX7TeVOvJadn2ad3rRy5nNEJLliVJB2blqvCmODuoS+wd5s9pDu6qLSfITuro
	Wf1XiD3rMt336+okaOi0UpQHDvjc5NpEWc6phbIlyGm6gXqkw9tihz/UBLK9tmXB+0hvgsducmK64
	gmGGfSgbaTxkTDT0Bpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR8vs-00GVXD-JH; Mon, 07 Mar 2022 08:41:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR8vo-00GVUs-Lt
 for linux-amlogic@lists.infradead.org; Mon, 07 Mar 2022 08:41:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id r10so21976803wrp.3
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 00:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jgpf11r6JREUakzcMH7I1ug/w8r11Lg1Dun9m6fhLxk=;
 b=K8x6OwcGNWTlorJJiD/N18xtHzZK/Ig7ebH2isVXcBYEW6Vh/nngKYaeeD+TbJWPpU
 yCHC/2+8iN0gG1SwUBAWRiP3bqGmG4F5FH4aQAP4L4+wWWpYYCZFSIYREts+X9ATHrP0
 iENdErazQZAzjUTWp5OagwltQZ+9+ViJVYqyG+LZi/KjwjO42o2/E8c7l6js+M/3oRxm
 T4EqD0cn4mCDLMzW0PMlgJ25cKEmaEgGLvMHIFc8L1TXRs6Bx9NeTdV9Uy/W6jAUmIGE
 mVCD5oezfk6e1LqyMOg45vNfs0J+9ZeY05vp1pzOM6OJntRoNPRBGt/n763nJS/Mwo+c
 wR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jgpf11r6JREUakzcMH7I1ug/w8r11Lg1Dun9m6fhLxk=;
 b=p/xo+kULi9nAGSN8qEJuNuFF11GwQMoJyMlYzrI/yOsyPonErSFbj6lFTYKh5WD86o
 TI04TUjmFR0FkGNR9fEOaWrTk/kfjFp1Q2tO/3zrRUHuj2mydG2ERDbPyzyh1qc4yKGY
 2cL/K7wi043k/zp0zwv5c82T91oajXB3/626p8a4fGQ6lf3YaWxy3eypmc2HrFJbsMbB
 fLnn4/gHXi3EqL8XdFN3mtuBUjILUVBJ+SGvw5WxHXzvAuaLvFw+5NmpMYkw4T9+1sN/
 aX1EV6DHjge+JkbvDxHpdXDw4/XNmoxx4qrKjTS+Yf9YAa6ebcQG37q71prteXcBb6R1
 A65A==
X-Gm-Message-State: AOAM530kNgDC3FGhlPn/ogFxgZavGiM57J5QhUc5FvLOgjF2GyOo2NdG
 zlOn9RtxEQvE3o1OmZ0l0XYMug==
X-Google-Smtp-Source: ABdhPJwXlGvZQmeKxxCzapULuFc47U/oA64bW7VjZL07iz9SNIdOFm0DOjZntjE6xGt6PUKhLZoYFQ==
X-Received: by 2002:a05:6000:1569:b0:1f0:47eb:eafa with SMTP id
 9-20020a056000156900b001f047ebeafamr7381021wrz.194.1646642487195; 
 Mon, 07 Mar 2022 00:41:27 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d6d8c000000b001efd2c071dbsm11199969wrs.20.2022.03.07.00.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 00:41:26 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Shunzhou.Jiang" <shunzhou.jiang@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com,
 khilman@baylibre.com
Subject: Re: [PATCH V6 0/2] Power: meson-s4: add s4 power domain driver
Date: Mon,  7 Mar 2022 09:41:27 +0100
Message-Id: <164664248244.1285549.14653525234263258346.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307025357.1368673-1-shunzhou.jiang@amlogic.com>
References: <20220307025357.1368673-1-shunzhou.jiang@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_004128_740654_FC24A567 
X-CRM114-Status: UNSURE (   9.21  )
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

Hi,

On Mon, 7 Mar 2022 10:53:55 +0800, Shunzhou.Jiang wrote:
> From: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
> 
> This patchset adds Power controller driver support for Meson-S4 SoC
> Likes Meson-A1, the power domains register only can access in secure world
> 
> Shunzhou Jiang (2):
>   dt-bindings: power: add Amlogic s4 power domains bindings
>   soc: s4: Add support for power domains controller
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/drivers)

[1/2] dt-bindings: power: add Amlogic s4 power domains bindings
      https://git.kernel.org/amlogic/c/40b358f6156ac516e33e5252a8769737054da24e
[2/2] soc: s4: Add support for power domains controller
      https://git.kernel.org/amlogic/c/f2b03c1056ef5c0829678f51273eace3e6327884

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
