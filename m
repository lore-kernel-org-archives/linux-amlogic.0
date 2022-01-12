Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE9C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9O+qKvjVoN4o5q9Y2iXCZsTD7as3Yg+kJ1NT681xz8=; b=vH/MSlRv9Mwr/F
	3j8SLeznM1CgUViyoBrkXU9wblhSgHg7hS5OXXi5l5DkAh9lgv8VW/Y/4x6esLqtvrclJLdsfdrA/
	Sj+mhDWhXnM3MjXUuiySIHxdhTbS3LEl/avJKDrx+SyvpijCI78oFrEiAEcoezYTNfCEHvGJ/F6Fm
	MgbQpNPcYOef7FtTQNCvTk65cX/QFkXfTXBGSjm3dCIQJVX15HMC/SZYItfvtVf6EhFiY0mIbrxCO
	ShNp5SYGNbdXxXuKxynMYboosddSx6TevlzYAF17BS7ZGILgRFM9JqJC+2VoEcPe+nn5/qe1ENQZO
	H7oX1On7y3htgrsswz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Z00-001WSM-RN; Wed, 12 Jan 2022 08:28:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Yzh-001WL1-OG
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:28:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id l4so990649wmq.3
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rNOuAcwNuDHxBvtMyyjJQMqiXIXS4T/5jqGLQkkMpuQ=;
 b=s+v9/098gsrdVTljt+5QzW9V1NPMHTbPtDgclKahM+vq9G1BEw610BrHv9evjZXf2f
 JnWmzUalccfJXAbQior7YoU/ozWAFfQgwGflBphtcINF9XjGKocasvXfWPBzJqVYbuJ2
 +RfWKnOtk4FIGS1ywsL5mL445ewcgsJtniT9FmbJEyBSNlA3qUffLhjQQieIGox2+xJ+
 6BO7wxMJoMpw8R60VVme2KxLVmqEIgHy6hJrE4aPKfN1jJMFhU9lldBjNX2VSKl7JWZX
 y6yPmdiWAzrEtFQlleihXj6Wtk+z51iYgqRcm1Oxu4ortyFLfKGaa47sPqX3dhpU91nL
 9c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rNOuAcwNuDHxBvtMyyjJQMqiXIXS4T/5jqGLQkkMpuQ=;
 b=UQxttpINbIfMrEgioEGPImZiWSiWzDUfywG8f/oNGhlCxV4XIevcGQ3KeyGW1UsW1M
 HgVzkDY2NIn472HEbYcnov7C2OwhjwN/nKXRi2sESPBuGoNzt7iASaG3aLtytvHF6dyj
 DfbJQTiSxRyLth6ilgJn2QEKpNLZPLWs/CSC6Yml0v1Qsj/uxHzJp50iuzFlZWotbYej
 uLz6n7MwbALobaq2y7XZn6B9iwLqKje7HozQtowfcfietf9htCTh8BQUZ3DnfmZKz6ti
 i/Afq3FMyXpDGHxDrfP0CbfVrNaxQXd3vJqhXCjsEiKx4RKrSyCPXXaLZ/I+9lXTO/ZY
 E0dA==
X-Gm-Message-State: AOAM530p9dscUj3pkTtfQcoo3zG3P3WVJj5meK5ac1SJ+9pHSeArM3wC
 VPiJb2qqQk1C0uNEELX6acvvNQ==
X-Google-Smtp-Source: ABdhPJwNpciLzIeYCvtRMHHFH5XaT1yQy0DngWu1Fc1E6DGL2A47DnOCrNKY5gbBMH+hiZbqjkezYw==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr5682629wmq.152.1641976109447; 
 Wed, 12 Jan 2022 00:28:29 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id v129sm254846wme.29.2022.01.12.00.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:28:28 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Vyacheslav Bocharov <adeep@lexina.in>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 kelvin.zhang@amlogic.com, Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH V3] dt-bindings: arm: amlogic: add S4 based AQ222 bindings
Date: Wed, 12 Jan 2022 09:28:24 +0100
Message-Id: <164197609473.825600.4070247492095618792.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221030014.434-1-xianwei.zhao@amlogic.com>
References: <20211221030014.434-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_002833_819116_B6D07985 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, 21 Dec 2021 11:00:14 +0800, Xianwei Zhao wrote:
> Add bindings for the new Amlogic S4 SoC family,
> and add binds the compatible for the Amlogic S4 Based AQ222 board.
> 
> S4 is an application processor designed for hybrid OTT/IP Set To
> Box(STB) and high-end media box applications, with quad core Cortex-A35.
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/dt64)

[1/1] dt-bindings: arm: amlogic: add S4 based AQ222 bindings
      https://git.kernel.org/amlogic/c/fc32ca1ea6f74c1be7abf9d21b0bac8bce11bec3

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
