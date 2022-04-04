Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD68C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQg0J+JYARshlvysObTKJevLUzyql1InU1v8PNbdGJs=; b=B0V8JedeCI5xU8
	eFSKDsNVHhMwhhxakrR04FX0MB8itRECXDWYkxMjYvW9e7gTBlHN//qin7YeeZRCpEWmvXkhS4Nkn
	dS3gn21ayVF0u8EQQ3QbFyM80IE1PE02s/uJ4EKR+4aKbRPAQ3doHRJ/P67mddPellTH15yheCehP
	iVkd1zl8iYBWPEtm6FZFmmuPUuBJ+fv+UpOBKIRoIqDN9/TuM1WhEn07qs7++l5CK6XOcEQvoTz0S
	zEqOgPR4A03emDUC7rUDx0zOZcv70Mw24xSIsHmmu7t63Kp2ls3rZ1enOAZ6h89r9eJfe8zd0Tr2t
	x/q+u9HQl4jnpxZFvI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHpK-00DmUV-7Q; Mon, 04 Apr 2022 08:12:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHpG-00DmSy-Jq
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 08:12:40 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d29so7136732wra.10
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 01:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KUYaNEQe34m5nOz7Zxkxlzwl60Qyx6SmSc4/ZeE2sI=;
 b=OyiZylLrN5ZiRuFLVbMbZYHLj62zDMwd2urabqGZzwATM7FAHvAyaauPvXzCW9PJhb
 f1km0830T1d9mjpXHyTEAHFYJk5BN/4k/zao0wNtp7iQT20ds3gTulXnyu2Zxt8t+fjT
 BLpkk1BTvubc36HStJVXNBMSby+H/BDr8xBMF8mwUUd/s94CZNNUcmN4ZNo7vW7Dm0YE
 RHxZhbRha6RmbjFfafonVkpicxA0srIBbZO8cKhXdmw1KsS4DR9j5JuHEWVmi7CiJp2c
 GImq1qIJnZOz+Lh/eQMIgzgT6dUG2/f+Iw7lnBBTkPgpsVI47RA1r+WhK50c/0vEw9pH
 Vh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KUYaNEQe34m5nOz7Zxkxlzwl60Qyx6SmSc4/ZeE2sI=;
 b=SAj+1iMhRyM3S8Gt46X6jvXu4607cvZ/6OFkWkR/e1FPgspVaEXW+KVHDyT7JhT/Cd
 0889wiXe+50UYd9VAMw4xxq+Efg43vNHtF0q0nGOBD7wIb95uriSZnaC9cAFlro2DvY/
 8mqVrArsRVtv8HPnJ81KEls64RO5k9LxBK2zkn1VDEk6JyeLlmCvUM6CP9UNjSULSWL2
 CuKhVKxYtf6JinhgtuSYuzAB4ADvb/Svv+Glyyp6C+AlAARufhqKTpjhWkNnO4r4qvib
 2fUpsMFnvOdrehrp6LNOBkPlUQ/MEdf+ke0bVfOOnBHUC8m5xf/CLsRFIhZfy/QD6TzC
 QNCw==
X-Gm-Message-State: AOAM533JO7fgfObflha/+PrWBq2hkfbYljtZaJ9x0wDY/m9nllx8THOQ
 9FN1CcadARqEq/JOqyNPx+Jd5Q==
X-Google-Smtp-Source: ABdhPJw3MtEPc84beBjhrO06hI241G1wbvcyCar+JXX7Es91MBpaPzSHy40gU1H09PqfvpRlqi9Ayw==
X-Received: by 2002:a05:6000:1a86:b0:205:a82d:4769 with SMTP id
 f6-20020a0560001a8600b00205a82d4769mr15816745wry.424.1649059956978; 
 Mon, 04 Apr 2022 01:12:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a7bc38c000000b0038e708d163dsm3297510wmj.0.2022.04.04.01.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:12:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Qianggui Song <qianggui.song@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson-s4: add gpio_intc node
Date: Mon,  4 Apr 2022 10:12:32 +0200
Message-Id: <164905994877.1805420.15536867817056125438.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310092645.4303-1-qianggui.song@amlogic.com>
References: <20220310092645.4303-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_011238_713324_76A54DDB 
X-CRM114-Status: UNSURE (   7.62  )
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

On Thu, 10 Mar 2022 17:26:45 +0800, Qianggui Song wrote:
> Add gpio interrupt controller node
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.19/dt64)

[1/1] arm64: dts: meson-s4: add gpio_intc node
      https://git.kernel.org/amlogic/c/393633936976fb8bd2c26ae76fa8d30822bb7fee

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
