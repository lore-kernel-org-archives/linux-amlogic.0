Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEACC43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Jul 2022 08:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=27/YUZoHsb6B+mFALNURUxgo1FZ1KakCp9pB0flf6Uk=; b=kmkLXP9i1IkjkCdU9xqw/nkGiV
	DGF5jm+fCe8SHK3Kl1wxz9n10H0QSgtUgvhUqDSTyYPaqnc0sr6ptjWoprDMQJsJIQB/kocgrSl9v
	0HcN2QvzgmEEQLx7ygShdlz/ua0K8YmlGcUvc4VAQcsB/ItsSYK81ycLMvR6nx0TCH7N4lg/zJhSh
	FN8rMv/utdaRNLzBYUSkHbzVqQIPhIfFGhgkqAUzVDN+Ydvs5U7hIxBVB4JnOi9/ZvqBFmVo3Ish7
	r/9YsBWH5nxAcIVchyeBs3mZWRaq1bkj9AQjLspC/vnIJjCiJVSr6Wkvv+7PowGZm1QsvNysP5v2o
	QgvzMgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Bjw-003XkD-HX; Fri, 01 Jul 2022 08:11:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Bjt-003Xik-Qj
	for linux-amlogic@lists.infradead.org; Fri, 01 Jul 2022 08:10:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so787144wme.0
        for <linux-amlogic@lists.infradead.org>; Fri, 01 Jul 2022 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=PEvEMy93ucfW13yHE94YOmbNRns7+Ib4NBPXZ7XvoEw=;
        b=Mt1RuHzngbB+zqsN2kd3N9qgMKxQd8fSXs0VW3SVr+idWjDX3a43uW9ybY23sRfk8h
         WnAykZv8wpeqmfwaAQizocN5GbJWqO9ODFDzqC5Wo82ylW+X9pFpi9eZZ6dtRSo3hdH7
         JnEBlJwj7Wlg0daMOi0bYNPwOHxr16gPeXnk41ElhOydvflUfkVqBSaMkmnHsLk44u8i
         CNFukCsm7KSqBrAL8pD1y46qq9Kslq8whJl+lelvcdljD9zJ2Dy5VAyULjAl1mXfIgT6
         W6Q7fUIP1825C8EzUUY2ia0PrjGyzw1fpzOWCQ2a0XScjtyhWBPW+RarE79lfrOb7tc4
         roTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=PEvEMy93ucfW13yHE94YOmbNRns7+Ib4NBPXZ7XvoEw=;
        b=7vkvx932ypNd8R1reMN+d2qEJhFbQWQQLSMFKq1TVunr3bLL+njSfYP859L4M/+tvg
         U6vHo8397nVm+16MsWA2djlsZDENdoPK3DIGBh9Y1yUbSxOxmEt1KWu8ncH2AFW26/jI
         8PjqtpenBBfFb91V2BNWwOd/WOuQ5NJike1FrA3l9AXY9KM9rgxCSrqt1IsmOX3Kd3pU
         Af90RopiR1bW8cX5QkTkABjB/LfF8tvz29BCNKcqfAoR8c1wpMOdNY3tnNXqRuy7VIcr
         UDAgyF6vyEIIGZEVYmkO09pnq5s3dYlPSF9zCXVcbyYBXjHIxaJnk9cpd9BTTM/yw6st
         +OMg==
X-Gm-Message-State: AJIora8WsLzK6hYbHmGkTSnbuLfua817BO1fB+yzpOASDMOA2Twllt0o
	S/T6r38BkIBf7DofTHxCezf8Tw==
X-Google-Smtp-Source: AGRyM1trCN/aqUGFns0X8+n21lgxvxmp5/Y0AmRjGUhA0XB+qgR6KYewyfaRVQiJSZInBfkaqKIj9A==
X-Received: by 2002:a1c:e907:0:b0:3a0:3e42:9c72 with SMTP id q7-20020a1ce907000000b003a03e429c72mr14806896wmc.162.1656663055560;
        Fri, 01 Jul 2022 01:10:55 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5d81:390:1737:2a33? ([2001:861:44c0:66c0:5d81:390:1737:2a33])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bcd02000000b003a0499df21asm9748688wmj.25.2022.07.01.01.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:10:55 -0700 (PDT)
Message-ID: <51034acd-13db-5c25-7b9f-ff87537406bd@baylibre.com>
Date: Fri, 1 Jul 2022 10:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Neil Armstrong <narmstrong@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic ARM DT updates for v5.20
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_011057_936026_8D8A33BA 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's an Amlogic ARM DT change for v5.20, a minor whitespace fix.

Neil

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v5.20

for you to fetch changes up to c110f7a94015a8da24520c5f460dc461ffc30a34:

   ARM: dts: meson: adjust whitespace around '=' (2022-06-10 08:34:15 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v5.20:
- adjust whitespace around '=' in ARM meson DT

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       ARM: dts: meson: adjust whitespace around '='

  arch/arm/boot/dts/meson.dtsi   | 4 ++--
  arch/arm/boot/dts/meson8.dtsi  | 2 +-
  arch/arm/boot/dts/meson8b.dtsi | 2 +-
  3 files changed, 4 insertions(+), 4 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
