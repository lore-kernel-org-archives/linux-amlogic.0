Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E5CC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 22:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDsA4+XGHOfRkgIr93lQnhOShgGo3WiHrfGPBvN7/i4=; b=nkW4TyfitqI5CL
	v1rJjalq7qEs4jQk5N4VkFsl4ROmAcjGPYyGJyWfuPlhNNTiWfxwj19t6a47X1MDBuqQOw2Pr1kPa
	dApT5y7e0Colb8rDnDBV6fwcogj/MjtbfGGXXY29xQVSqseGjRPOp2qbNHLOSj21A/xbUMOq2gHHB
	t1jLArIJ+m8jad3e4t/zh3TAaQ6RL310mmGFrJyL7VX8N15oe3MEIou3tJHG86ySKvsR6KK/UKetw
	hK0tc5XvJfZJtb5NqxB5DtP4YkcqO0DfLA60u4+n2SePS/8ttsRs8p8KWljgDggDHAmH4vWK+ZxyR
	dXx3Y5fZil0obKHAWBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAJZh-007h0Y-N2; Wed, 19 Jan 2022 22:37:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAJZe-007gzB-MG
 for linux-amlogic@lists.infradead.org; Wed, 19 Jan 2022 22:37:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id e8so3547300plh.8
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Jan 2022 14:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dxE4r1z1cIfSGWJM621bK96VrUIyVV92x6PrrwpFRXY=;
 b=3jmCLS/O1Tvc4I9EcgW+vSU8+bHw3fiuSLb8QBBFgnjhcJ5TBVgWAsgBRkL3a3BYKD
 B38FGcRvYxRCPVi9I//mp1Op4BJClqNBzMkBUd6cytmd/QdYvSp7N0XjWzvC8oGGsiZP
 YIoTbzn7LIhb7DJlIo12jni+ncZcxIDEl1lNAtS8/IYRdIMQhyD1m6LD7ntzYNxIi4sn
 7yK8JltnuRpVwKYL85hmJpwtSbixKHx9L9ZLo7vnpI6W7mzH8+gTgQ9XuKzBg0btwiD4
 lqiBj8d7xmg1PSH6vq7/iRvjAhhGASBFqeIMA7g6mDLZ9NltVPocwZazaaUs043hvvCW
 OQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dxE4r1z1cIfSGWJM621bK96VrUIyVV92x6PrrwpFRXY=;
 b=p5+HA9cLnMD3Hj9tqdAWS1J1mFpxfYttjjOW9qSRNBtiVqirkT3Gl0RWRD1atQnwwx
 aLTjMdliX2YrfatqpnqiZhUD09RlFfXhzToXjj5HQzVESB+/JWBpMOHwqDSzm53NGjlB
 fplZRcDVP/cLJ5HVjmuDjMWNQwQDwKl5ezegLyqaomml5/nTvqGo9bzzQdq5fvXn9/M1
 x7ARZDXVV7xsjX2oFjVierDg/1XECqQL4RbCzzy07COh2aUO+Ekaq/94XDpXCwlE+/87
 krEgwghhDwBCsd5CIRmSp+rg40r8yQTWHNhtt+sHpqpiJ5b8E3zysiquJQ8hpmOcEGf+
 vKBQ==
X-Gm-Message-State: AOAM5334Xna4Rje8Lz66FE/EaZ9lYMH1jlOrCnkFRQsKz6/gatmgqHtH
 b9jjIFlfof1TsFKIv1Gu6MkchA==
X-Google-Smtp-Source: ABdhPJxv6F63q9VzJdxY0ckhpZZbC07AudfrnDivjIRxSeMR+ozHNzZi+g2TSfEoU169TmiRdyIcag==
X-Received: by 2002:a17:90a:6288:: with SMTP id
 d8mr6922737pjj.199.1642631820957; 
 Wed, 19 Jan 2022 14:37:00 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b9sm587995pfm.154.2022.01.19.14.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 14:37:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu
 <yu.tu@amlogic.com>
Subject: Re: [PATCH V6 0/5] Use CCF to describe the UART baud rate clock
In-Reply-To: <20220118030911.12815-1-yu.tu@amlogic.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
Date: Wed, 19 Jan 2022 14:37:00 -0800
Message-ID: <7hfspjqrn7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_143702_798826_EADB8875 
X-CRM114-Status: UNSURE (   7.67  )
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

Hello,

Yu Tu <yu.tu@amlogic.com> writes:

> Using the common Clock code to describe the UART baud rate
> clock makes it easier for the UART driver to be compatible
> with the baud rate requirements of the UART IP on different
> meson chips. Add Meson S4 SoC compatible.

Could you describe how this was tested and on which SoCs?  There seem to
be some changes in this series that might affect previous SoCs.

Thanks,

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
