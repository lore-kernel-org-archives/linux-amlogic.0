Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D99C25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrGp6lYiCkI2jjXCQVddLhaXEa6dNfk6OwtsgrSQO3c=; b=cV5bqBu+41JZhg
	jX4YEgvD+gLju/l1Ynll2HXuSqXqVf/LBGew3h8VrVVqgG3ue6mRl9D+NcQLmyzLdC27EXn9Qg2fc
	I9zit8dk2qvJH1GhbMq17bKX1C59i0KAIIUII8LrGLkSNacVeXuMDI3Sq/tm5yI9HiZj69WiPCdS2
	Z+c6eNj3/cmqaqZ8yQI/YHY9oH4svqW1ei2H5fa8pGZVMctjAKsUBEXkUrSNY37cCtb210ewcY2Zw
	ypdde+hi/fFWmKpkiDvjZ0XyG0fIhWDhLcgULGcta/qX+mfZb4Exe0eiWUl5DVelyjiIQ4FgQAFKY
	+HijpYBJzBGjZCgikP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Je-000000096XA-1QSi;
	Thu, 06 Jun 2024 09:21:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Ja-000000096TI-1rJc
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:21:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-35dd0c06577so774398f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665704; x=1718270504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW4EvucckY8CVmeUy8IT9ST3GVjxL8wLdD6zQ7ebgWc=;
        b=M8zwgTrrBJXfGs2JhCA1/98dR7xl/EVmRyTcgf5vU2+/eFaZmC9ZHmZdcY4HEzUG2w
         5CZzhVQzrem5VGKQg2Z13iHdSDZ5rGCyBFLeWCpgBtlJsyuMOdXBaC0soqai6/tpoUg8
         ZzoREThM2/mGIeLqltJ9+hgG27H56oyBIOuYo7WXrXH7OS4LIK+TtrxVcTiHHPiwF/LH
         y9uhA3vDjvyWjPCQzz1gjwp4Qg0xYNUChExhXGepNRQ9lD1h5CveSu8PcmaPoduEAfUs
         es+HmRuEWOBVrDQmagFCg3LXe+mnmYk9xuUs2iPGxgEbsSNElnSj4XJIPJXHZHSoGWO2
         5ImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665704; x=1718270504;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW4EvucckY8CVmeUy8IT9ST3GVjxL8wLdD6zQ7ebgWc=;
        b=by9TcS2PpAbpyMNJ+klfowyvFR+h8BdzDSS04S9JlRUmA/GOZuuiWzj+PhqL2pczC/
         vbIzyn0QFYu9s9gh4qUiFl/W2QMJowBOGJn9BHncIw8jW7PWPwoyVC1n/O42TXp2BOrs
         6CrwhOXMbGMRXsduhDtRZpIt+UfcqS1oUbD2Y75MIb1gGWEML4/vQbuEmeKv+3jXDxv3
         L9QkljZDQ2/mP/K2uKRLClDooMw20V/AxODURmZMlkZqubyQzJTvMuSAGLiRvilI38fg
         4et+7/sceJ+z8w6mvgdKZLXSvkRqG9pfmuCDiREkg6RR25R/VCGM2008vy9USB8ggZpD
         x01w==
X-Forwarded-Encrypted: i=1; AJvYcCWbB2OlAk0li3mwiQ9Eak/z+3PgGUjAb6NXa9zHVJhUz9zewSGvRd8g+peweLlevRmIRCliATBdafS6MojLAhFR8aYqEPh7n8ihs4d0vCciqkM=
X-Gm-Message-State: AOJu0YzsOpmB0u54SqBQOCe8Tnkepe+FDv8a9bLyUOtnM0+mAJO8QP+w
	ucF//TeDY1kcKpej5qzC1wwAR7KezSIYxbJim641TXgwPikmJAMbiQ5o5dP7IkY=
X-Google-Smtp-Source: AGHT+IEQUFhZ4ffQXqczY6bwPIu6J1c6sh9bixcCzNZvbDmwint0JLpN8+SWvWpMQ7EjeERX9pZH2w==
X-Received: by 2002:a5d:4c52:0:b0:354:fca5:4190 with SMTP id ffacd0b85a97d-35e8ef09a32mr3843778f8f.41.1717665703974;
        Thu, 06 Jun 2024 02:21:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d4a582sm1033012f8f.35.2024.06.06.02.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:21:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
In-Reply-To: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
References: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
Subject: Re: [PATCH 0/3] Power: A4: add power domain driver
Message-Id: <171766570315.3938980.14182626736757886496.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:21:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_022146_605058_7B10AF0F 
X-CRM114-Status: UNSURE (   9.68  )
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

On Tue, 28 May 2024 16:39:27 +0800, Xianwei Zhao wrote:
> Add power controller driver support for Amlogic A4 SoC.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/3] dt-bindings: power: add Amlogic A4 power domains
      (no commit info)
[2/3] pmdomain: amlogic: Add support for A4 power domains controller
      (no commit info)
[3/3] arm64: dts: amlogic: a4: add power domain controller node
      https://git.kernel.org/amlogic/c/c830ead0d16131de93d2020369ede4d670a4123b

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
