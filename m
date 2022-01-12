Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01421C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtpbCRNLHOhwlyomqwGQRcBr3AbUc/YwZNusHkPQikM=; b=Ks0NzCTUh94GSx
	v8AQ59u/jnyMPMj7kqwv3sv8LCtfsjzzKefBMoT5FNiQ1g4ghm2vobfy2Az69IOm0MFkliWl2n2Wi
	/RKDyJcjXFTU1cYHk+SbnwSb/8HJf4LSv/uxzmk+4Dr7Ai/+/M5ndxgMUUaARriro73trKDkbKC1T
	r8Erd5JvKP3NhISSC+nPI/5mzg8lVBjnmECaf6pfvL39cMaNGcw5QnxpSdzX9X2XCHtwkJHLkugsV
	UAdgrbI+3HncmEoVRAw96nHLzOqsNRuDWTG1J431RNTSnGD2D5oteBzYpKJX6o9bsyECthmNljTPG
	40GLs2ycP/vchQDyrFhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ZAm-001aNi-QD; Wed, 12 Jan 2022 08:40:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ZAS-001aHy-55
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:39:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so1102482wme.0
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fWG9vBcQpdezGVNfoLqs5/hoQhuBz1pfm9w1OuCGqus=;
 b=WH/s9OYrYJ4YRPiYQv8neNcmG2o+THiFmc/yCz+U8e4uX92XDg7GP7x2jPBvcKgmH/
 8tU5RvwdiTLhpWVydkOxRlN7nU6KwRZ37Fi+JHyUPkxG/8BEF7sGRazLni73pgk7tgZ/
 leA3eHnaNowIUfmKMlKJHKpXYBMXxDVyusrA0Pijxq/qGInz4JkCZZLvQD4oAgBJKMqI
 B8hNRE9O/Nd1S5tEQ2vfV+tG2TS57BB/mR0pmYtl6P/sMVllBRsXr53U4sajK/Ed3GtI
 YlAQjHk+FAQcqAuxuiiIlc+pakhzAvLnARovUVZe6GvKoc4SLtihfliZ5Rc6M6QBHbfW
 yRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWG9vBcQpdezGVNfoLqs5/hoQhuBz1pfm9w1OuCGqus=;
 b=IGJr0MKs+9ZSxGjytqY3VT8Rle67IM1HC8KZpzRb+iPqyoxzanmVlG9+YqDjzA1Dzk
 77+pIomOfDlqP8J8TfyyDGlFcsLUfdWejxSOmHmJElfqHv/6tuD1fXVrv1Zv4YsXDfgC
 7Hqe60kImDPNM8o/gYfTMXeqEYz9FQfPNEoWdt3/un+dmtLJ3AElHsDMtfWr60TvvMmQ
 tBN+gVvjvTvpuu0hMO0D6zulE3Pv66cdxY8VKU5SMO/5kcQsctZcQ2fYrK8pyVgXs9pJ
 9k2WGaoWNQoT+9bbiS9eY37ZGxUFeqwAyhIvvLxTUuLWOIQXPQO6BtyiT+sOHALR9GCm
 t4Iw==
X-Gm-Message-State: AOAM530TtQgVmB7CNAmhg5kP5KqLIPJlj0qXrUK9Y5L0xvSh7RgpuQYP
 9sKbKpz5cB1PS2DmXV7osWA6tA==
X-Google-Smtp-Source: ABdhPJwl+znlZE+kOyE1H6sd8NVFx9t7L4Bia2avp1k23EUyp06dOzppYbH3jF7zxdCzUDL3750V8g==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr5829621wml.49.1641976778273; 
 Wed, 12 Jan 2022 00:39:38 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id m7sm3653368wmi.13.2022.01.12.00.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:39:37 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH V4] arm64: dts: add support for S4 based Amlogic AQ222
Date: Wed, 12 Jan 2022 09:39:35 +0100
Message-Id: <164197677138.826461.16430612345551126459.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106112214.6987-1-xianwei.zhao@amlogic.com>
References: <20220106112214.6987-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_003940_230788_0FF9ECB5 
X-CRM114-Status: UNSURE (   8.37  )
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

On Thu, 6 Jan 2022 19:22:14 +0800, Xianwei Zhao wrote:
> Add basic support for the Amlogic S4 based Amlogic AQ222 board:
> which describe components as follows: CPU, GIC, IRQ, Timer, UART.
> It's capable of booting up into the serial console.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/dt64)

[1/1] arm64: dts: add support for S4 based Amlogic AQ222
      https://git.kernel.org/amlogic/c/1c1475389af077a9636c22dcb8c9ef498b48fcfc

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
