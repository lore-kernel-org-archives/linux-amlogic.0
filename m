Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6162C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUWaD7ThWbNeZujZIt245QhwXnCTnjkzr3K2zsqQuhA=; b=0KkxlUo/+UTSOE
	SC/Hb5X9bS3Dj/Yti1MchISzyVZPW118GPSsLpUuX3EeqJWKsHHb8yw63LHQOMdIPCzTT2tMoFxbO
	3OKtku8zJd3igdcuvnW/e2FsRJuOqJeeKfkaINehJzhc3LT69V0lbHccxjh2dZMqZ+jk3XkHk5tEN
	w0ORilUgP0Iuyd2HcDDqwvt6d58O/BxlPqJ3oWtaa0oWTmDXYgjxIcyVNfA6Q9odOEyAxRM8KQjlf
	7c7+HKIX/vGlxuVtJpGWu0alXezyz8+hGzNjSbLw2OPPUWwSBVlT1FPQDnJmX7VJ1pl8a/nre66Ci
	Vazvuqi9kQcjSIWIWuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjGb-00Fau8-Ag; Fri, 08 Apr 2022 07:42:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjGO-00Fao0-7F
 for linux-amlogic@lists.infradead.org; Fri, 08 Apr 2022 07:42:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id p189so4912728wmp.3
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Apr 2022 00:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHMATotH/7GH36y4JV3UnVZN/1YVFDx1H+DptS3+PWc=;
 b=mu/sVZgEh6+wr0/vA8nHityCIOLvTeBafSpMxYQg0Ho/GexTByIYESg54GUWecIReL
 Y5sFAnvh5Q3VphOaUxz5yeVAuVd8RjGVzh/WundduB03NIeJATZ/Ev+TguQMVev7rt0r
 XAINJGkAohkGxKSwgUuPPcd0urmt1yqaw047ssYtI8GaW0Nuo9azgC7MUM/XlDZdZJBF
 5Od84ntYjv3Rhvpn6BLuJb6zxuk+v6YsXIFoQWDXRIbLjoXAHSQ/9f+DWyifn0xA7PiG
 qg6ieRl9nCgahuy8ePNmpLqFzahtcBr4rApLtfKP8svON0SgHt8iptL0upMYU46x5Z1N
 NAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHMATotH/7GH36y4JV3UnVZN/1YVFDx1H+DptS3+PWc=;
 b=bitE2d+K2hSZP/QuEAn/uFRAps1b25CZiFOFt31+U2Bur9m3Rjx73fce4G8bJMF8Pk
 6LYgCYYAiFN4YULIjvvtTDYa/f/qjg4p1LsmSbR0uJ69QlQXvKI4+H8Wjhu3IfRUfzzD
 V/knjX5pqIbJUNjfZ0aCGAVQ1FbzfDcIqUdF0sEsPCWxpXQc8arda45mEDUxoVBqwjPK
 uSOSDztRROg5eE7PV+rQIgxamnYpB51sZap9QN2HvZJLXSJfsY1a01cJQVnYGLvLfolD
 LSq6cSPlCv7XoI4YuG4P6fP+vNSwcP3rjAToxWQlDyX+7X1prwA50WfOFqeTti3n2SOG
 Mb7Q==
X-Gm-Message-State: AOAM532a75IRlbdrTZO+eBlSRYW3Vh6s59FO/rV5HQYJgk5tWojbP2Hz
 3JCViQ2xYyoHO6/uNA0bGk83Mw==
X-Google-Smtp-Source: ABdhPJxvN2y8IaSXW8095VaZadvE9+99TAQdw3rmhA3hdG8AgGca4W0iH4zucfGoysujnM+oIij5eg==
X-Received: by 2002:a05:600c:3d0e:b0:38c:9b5e:52c0 with SMTP id
 bh14-20020a05600c3d0e00b0038c9b5e52c0mr15289652wmb.3.1649403753807; 
 Fri, 08 Apr 2022 00:42:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a7bcb84000000b00389efb7a5b4sm9241164wmi.17.2022.04.08.00.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 00:42:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] ARM: dts: meson: align SPI NOR node name with dtschema
Date: Fri,  8 Apr 2022 09:42:32 +0200
Message-Id: <164940374766.3650310.16771762331635334011.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
References: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_004236_289047_12226B7A 
X-CRM114-Status: UNSURE (   7.53  )
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

On Thu, 7 Apr 2022 16:21:58 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.19/dt64)

[1/2] ARM: dts: meson: align SPI NOR node name with dtschema
      (no commit info)
[2/2] arm64: dts: meson: align SPI NOR node name with dtschema
      https://git.kernel.org/amlogic/c/8771ce5eadb5b73daab190c2451172e43e16ae41

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
