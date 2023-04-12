Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A010EC7619A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DoJnJOxsQLBIq/GIHezTZALuPH+3qYit1agmprfSC0g=; b=xn4idZ8OGB1685
	Df5Ul2IDEPeOvmsI6xFt6NBeEfs0ymaiD18fGWArpbF5IpBiKPbR7AdzVXORcC+4TFgKwOPEPJuhG
	UPJyxl+V7jH1Efiudy30+V47W3CxbHpzxT/V7L4yhBkGJzYGTzcxEd2DXz+JrMBTDwJNtrhvqibv2
	pMBMHyUwaJ3qUwF6Vi+Pzcmeok9tDmyq4cluTH2H5s0yyxgapL27LhmLSq2HxvCd3ud+t4RB0SY0d
	Dkmc8uQ6DsbtaL7LiMGlOtDltXbU0xN9Ziinah5LM9C2JHDORBJAnvPHvqv8V6+3vnvWEWRzVnANQ
	TCtG+EJPRbwPhDTh8m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjEZ-004Z6g-0x;
	Wed, 12 Apr 2023 22:46:35 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjEW-004Z4b-0w;
	Wed, 12 Apr 2023 22:46:33 +0000
Received: by mail-oi1-f176.google.com with SMTP id w19so8832592oiv.13;
        Wed, 12 Apr 2023 15:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681339589; x=1683931589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pne7zvLmG7QcEYfgoOlm61Hw/xE8wOJKTFUuUUTpcYQ=;
        b=EhvQYFthCRgeVTWF9ReajCZmmnAqxk0OPQRVXU7WMGu8mOkmkRbLCVKoWQi2xw9ejV
         kXm0jX/SwJ9AA1LyGdXgignn04lg1FNL+X/Nymf65tlnTD6jcPwOKEZIPUsM6MmXiobA
         2lVEvrTquFGSzs2s9j6A/4wRKLjYUqlqe7cMYb1AkLfhmTjX+0+OnNkCEzfXvz6Sqkgz
         RGiONBoSxEekQwwqA0rfTHKA5gn0TCkyNTq4uyf77gGsvsBLWw9MAhb7ZzJFVzfUfe1u
         lLlT3oIQFxCIFo3u5sqkvPJdLlRb3X2s+UCy/ZmXT4MfQoAX6W57w1ptA3R+pq5sdjfT
         4ABA==
X-Gm-Message-State: AAQBX9e5do8DWHmWYbhtHOK1MM9QS0qs3SOe7ZsOkpcGxsvw8ztdOMPe
	W5v0jJfnxRh+UGmYfDc5y38=
X-Google-Smtp-Source: AKy350Ys8E8JJq8xGCw4fHFXNKDuO1baUBk2ZioJngMRNu3jNQILo68Yl8tpyTKllxhZsNjoU/Jx5g==
X-Received: by 2002:a05:6808:106:b0:387:77f1:21 with SMTP id b6-20020a056808010600b0038777f10021mr104823oie.48.1681339589345;
        Wed, 12 Apr 2023 15:46:29 -0700 (PDT)
Received: from archfamilia.lan ([181.219.149.7])
        by smtp.gmail.com with ESMTPSA id cg9-20020a056808328900b0038beb8c1289sm50012oib.15.2023.04.12.15.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 15:46:28 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	stefan@agner.ch,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v3 0/1] Fix Random Kernel panic from when fail to reserve memory
Date: Wed, 12 Apr 2023 18:46:19 -0400
Message-Id: <20230412224620.8909-1-tanure@linux.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_154632_326911_190C8DE9 
X-CRM114-Status: GOOD (  12.57  )
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

I am trying to fix an issue where the kernel panics randomly on my Vim3
board. The problem happens when the ARM Trusted Firmware memory is not
removed from the available ram.

This happens because my u-boot provides /memreserve/, but it doesn't flag
it as nomap. And the kernel scan of /reserved-memory node can't map as
nomap as the region is already reserved.

The idea now is to scan /memreserve/ after /reserved-memory node, and
/memreserve/ will skip regions already reserved by /reserved-memory node.

Previous Threads:
#regzbot link: https://lore.kernel.org/linux-arm-kernel/40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch/#regzbot
#regzbot link: https://lore.kernel.org/all/CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com/

V1: https://lore.kernel.org/all/20230406151429.524591-1-tanure@linux.com/
v2: https://lore.kernel.org/all/20230410120017.41664-1-tanure@linux.com/

Change from V2:
 - Remove region overlap and reserved checks

Change from V1:
 - Instead of allowing to mark nomap a region already reserved, give
precedence to /reserved-memory node scan.

Lucas Tanure (1):
  of: fdt: Scan /memreserve/ last

 drivers/of/fdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
