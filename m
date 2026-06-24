Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3B5C43458
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2026 09:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QAeLnBphuT5KAA18LRMKBAc6r2URRkVtlS18tWEpPJQ=; b=UsSXf5ikXKnToY
	tRMnW1bMdGO0BIULsCxMsDM5ajxSY95isc1jE7t1Mdpe5E0p0NuiBnXu6SqaHSH2eY7tVX0uthBVT
	x5FynVyH1pQttbInACCVYNAj8QfMLo/pW4GHiDQV1qLGrJMIsnDHjV5TtwK0h/0XJqyZxKfK0qSJf
	+tqZujkNEScafN4A++h6aBzLfom3HDShIFfZGWTP7aQbPZ/eSk81ecoYfPbixErTK0nPTB/4jxuaE
	M0B7cjXvdsfv6clDD10h1wxbOuRZvExqGeoFkR5aSjz6e03YwcO931DNrK0+gAf979S+VcSkTophg
	3+vxGbT6uk0Zzc5tnCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaOl-00000006V7y-2xT4;
	Fri, 03 Jul 2026 09:41:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcILO-00000007LgB-3nzT
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 07:48:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so852608f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2026 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782287300; x=1782892100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuSzdW2MJov1ocYqkr6jypibzL/jxZdpgTXoZ4Ka2DA=;
        b=Gyc8ppcGfPYKxXwrqMEABcHU6LfAGwBu1slVOg3cIwdviAwHAF27GYlgSH4Q5hzVrH
         Ie6oyZCxPCfYzwJebW8WgJT8mxYIfvs9kH2Hmc07xq9TPBNz7e51qm+4ANoQnh18PVS8
         m2pJxH7H5DVB0i5ilYzY95Ld3hM9neQIbapTEfzA6JSeUByVsYKaufFJaKqpHi2TUdWH
         Y5b3bU/7ARjm+6LX6vY2wle8+nSDuCNbcoAoVKeBetoV0YSEfxMgnd+PShtty9QayTgZ
         we4bZ0get7fY//BZ0F0IURZad3FgZteV7BwduGPeRlsfSooqsbHmOEDGLrcxvvAeTDQr
         ZOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287300; x=1782892100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuSzdW2MJov1ocYqkr6jypibzL/jxZdpgTXoZ4Ka2DA=;
        b=i2oOisPN/A4YO2sRVEF3JZ/LJsZ3RksHW+NXNkprgatuO+koU08NXKlt7/XNBnzel0
         b9fO7acDUhOSXweiqdhtexHwfCZyGhqPV4x1XGgojQhxCTvj3nT6PFu9ez7x7V9b3Ndm
         uL0D8I5vEUza7yHB4+ZBILiVr9kRAaF+uxnGn3HqO5rGbm9KMuD5aBBMwaOFwApiCt04
         GhnMeJh+/VB9hMB8UeQ6fOqtU4ZbyuuTc8HujZTxx61dQCJOYcsnTqft4bUT/vIlwWbu
         dy906ZOFdBKbyZtD1WmqOFi8N3DIpH/oUyRJchV+CqtMhEOjnQT3oBFpQjzieYQ6WUe9
         GNww==
X-Forwarded-Encrypted: i=1; AHgh+Rr6HBcDSltYa9v0493tZh9+UEeKLWRd8tDp0ufQfr3HcxDV9sUJeh3drNsQVddTH3hBUWNwcQEobjM7Z/PD@lists.infradead.org
X-Gm-Message-State: AOJu0YzR0ny9Rdk1P5LnIs1Xu0Qj0lz/5bSQdH81hbU4sqZ7Rqpv6W2t
	/j/fa0aFuD8ZkX+wR2E8NPTFcAfTMkaJd32q42hPdgdUZjeFkeOOHtvrxhM8etk56pKX
X-Gm-Gg: AfdE7cmci0zTvVugmygEXCLi92TRkLcSaQTlETy+OLWbY4fszo7iNy4kunsAPBREzpi
	Z0ilXdnSDe1H/TuTuGkhQ83qjhpngHJRzoGWdg24Ok6zsgMlMew2uUcgcMUbHOJMrJ0yQwuHYZG
	vaE8q/RZad78OBXvQMdTH+U//+9qi3tClxRVDMNBUgVo3DKvGbhRE01Hj9EPXnANDn/e1m5pvXx
	Opdez/vRqV3Bm3lnKSgLa6nPwWoqk/ft/zCG0mR0dviQwGdlscfRB6kjMEWNS8Jn8trD0JsLFVe
	HUtuN8g74CkAXVVO2+R1/+0woVuMO8CwbVkxUmNUIYe0DzwRwPuuccQ2jPCRFjL1ZSytTehY6fD
	huj2P+XycFsNo4uDJXhUaq/sjH5BrkwehvynOWq1w63+M3+X12j5iWj9rnFkHbOYkI85nLoA/q4
	FtY4eFnpkGICX7ZZCoG5j5DWQYpV4O3dYtiD/BrrLUA6Ee2QkbrZ2+oxIyc/PcUzfweKjAlu+43
	xnMvv3dKEFWpZgTXf5NwOWWqEJBnFyXSdI=
X-Received: by 2002:a05:6000:46cf:b0:461:a15f:7aa5 with SMTP id ffacd0b85a97d-46a806bd4e0mr6838960f8f.21.1782287299681;
        Wed, 24 Jun 2026 00:48:19 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm4737620f8f.14.2026.06.24.00.48.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 00:48:19 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: linux.amoon@gmail.com,
	neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Wed, 24 Jun 2026 09:48:17 +0200
Message-ID: <20260624074817.27801-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_004822_956282_EEA7B166 
X-CRM114-Status: UNSURE (   3.99  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 03 Jul 2026 02:41:26 -0700
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

Hi Anand,

Sounds great -- please carry it in your series. Glad it helps, and happy
to review when you post it.

Cheers,
Doruk

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
