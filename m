Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FB9CA5FE0
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2026 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiitW4b5j7Ih94pY2eJuPNwOg8pZlPCxQWO32wWU7QM=; b=4WcS06+TOeXuJZ
	qQUkKPAph+5M7RIEm/hnxQ9EO9OP3v2UtL+trXtZ9S0H1nCOgj4bLTAroNGncz/bS1V9UoROrPjhu
	DLitp/WaZAYNegJrx8DoU/GC3TJkQRLIgLr5h8kU2aNNYM6XHfALNY3MPpnfBcggXlqzX0vcEF96E
	7XntIhZ2dAa/znhrAMyvvNSGqPcZ+Vr5u4X5LUiI3Lk3HXw8TPGaP2rU/w9R33uz7/ivSLPoNN/Ms
	lkucKjrE18UiXybl9dEAGW0TnEWC/ISd1MGogJ6sdJlyNKLw96qpBbtz9bxfSCwjHnkwJWFqznbyV
	U0HUx94TAVOIqlwRFJ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCj6f-0000000CPdh-3W1C;
	Fri, 02 Oct 2026 19:39:45 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCj6d-0000000CPcb-1Uz0
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Oct 2026 19:39:44 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so1021775e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2026 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790969981; x=1791574781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECA2Ii7AnEG4kznNqv+ar3v6vnQStjMbIFJDndf3wus=;
        b=OKKMxIslnZm2Ckdzc+sqJEwwtX4ipP4mObKosbFly9TfVht4x/gqrMTiazd/q4POv9
         aEw1ARPFv3KbCy5uOL0KlVgLFNuVg5jd15GM+CAt+Zxw4OG8pnav5TOqr5uImyjpDLO5
         z84XoFqXprGNAA4JlmuKppDUZ0Tjq3mh920X5MJDbPXyBnMf9V80ciEHDmJEP8JbMQmZ
         9YnsqCpA4RhT508sbcIwiiyAPS0TBE1W+SzcbQXMXq0Q6z+cKgwSQQt2ZQ4YBFQJsntB
         5hkdiYem3b/l4JLaKproyJ1YXePBfecZIUbmdmUyK41x/83vI3YjgI8jV3jK8nEFBG0J
         fioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969981; x=1791574781;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECA2Ii7AnEG4kznNqv+ar3v6vnQStjMbIFJDndf3wus=;
        b=ElTJMYy9kQYINWcOIzIQMwxzAw5Atq8ARFRHh1ToPghyaHtopp/Vb9q7ej/blSEY3h
         aOzdga8N4dJU5p8g9L5EoKnO4le4cKWTpvTcIezKkEaMQjaRvY+5t1EIC+5eTDWidBm/
         9w9wD+vfCLmu0tanQgl9Pn0q6Q3/OlZeiLO+/GdUq0K4NNc24/5MwackVjr4eNiQYt/W
         aBvHPI9jMSY6NRw4zJWuYxR0gVU2O7KtNWzJHKYzUiC0DJJEOvzsojmLr0Zq0WLFQDvb
         pHaX42bXvBLLM6WTtt2jRA4uqDwRLPvbk1zYxhZNPbdctUGAubIrk6eJifmw8h/7jIZp
         lcZg==
X-Forwarded-Encrypted: i=1; AKwUvBx1ElmiUpE69TA6GCqnpO0sfCPWChwPQqDC+pKREO7+7yITII4x65M8csxl64hp2DsX+0cPasp1QsW4am4C@lists.infradead.org
X-Gm-Message-State: AFuF++n3uaK6PolZL4p5GirQFs755zIdR+a5sOecCXs2V8WEWkuZ5LH6
	ldsJlBOLOqcaEW/Jalplt8Iw5lxkfYTXo3uaalRyabGeSu0pesEAQDbaKaHAIlGhW6o=
X-Gm-Gg: AYBFou0dtHHW2GJi5b5qPrgOl8UqpQfh0cTmPp1gJaSJuT9AC8uJbwcvXmJ3/galUox
	6ZSLaS0InhmK/VOYoKbBwGHPP01IqWzt/3iHlcTONN9h03LrVfyt2qkN4KGRYgs7EPtZ2311zt+
	4rqiEG13Jjl3PAx1c4nYDUcGlExkzrrlgWXrklA0ZlGZYVBegppuoyYuTNzTvHd/LBJi3vawlZ3
	cNZc2FyQ2LkO33eD3uFp0I2gyMBB4sfFJrWBjtlo52olAH8SLMdAxptSjd4QMvwZz7rtYAD/Ug4
	71n50OFMmge3KfN79AezRvDmozGO+Wzzdi7a+cjfEEvPuT+HdRxUCWQmuUd3oJDFFV9UwSNFfRR
	Jv0n9UN2cD8ZSKxFwiUagAvsbfYWYLbCVbg1zFWcqURmbnZj/As/fMtsYM3YQJE0IABFRq+zuhj
	Olol3Q+ocxVmeSVu210YryECQd4o3aTmq6aseNdBNlbRaEhgAo4dHmmLPIe6UAqdZ5q1zZuDV+V
	FZh7lea2In08zSvYWE=
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr68982555e9.0.1790969981261;
        Fri, 02 Oct 2026 12:39:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm104389955e9.4.2026.10.02.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:39:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Igor Velkov <iav@iav.lv>
In-Reply-To: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
Subject: Re: [PATCH v2 0/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix
 the SPI NOR
Message-Id: <179096998039.3351815.5090635259555854831.b4-ty@b4>
Date: Fri, 02 Oct 2026 21:39:40 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_123943_420411_DB868490 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, 02 Oct 2026 21:36:45 +0300, Igor Velkov wrote:
> Two fixes for the SPI NOR flash on ODROID-HC4. Patch 1 lets the flash
> probe after a boot from SD that bypasses the SPI flash. Patch 2 lowers
> the clock to 40 MHz, where reads stop returning corrupted data.
> 
> U-Boot takes this device tree from dts/upstream and gets the fixes with
> the next sync.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
      https://git.kernel.org/amlogic/c/0b825126590879812321cdab53786fcd906f7761
[2/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz
      https://git.kernel.org/amlogic/c/b44e2be772f866985cafdf90355285069ea68495

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
