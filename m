Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62879C74A5B
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Mar 2023 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IX6xvSqa4vxwzPZYJzYC0j8RKMM+zrAlEmkuBkSjGKQ=; b=lpKakZDQucMzfu
	7A9riA3jP89icUJSK0TZpw/zoDG3QKtNHX144WLkvH97GIhdstxpvQ4Mm9n1dEkfP+HOrP8DaYTnO
	i69dYJUIXJWd6yNGUl1espu9EBgtsZeJV8sAo+H4WmNFh2AR0oJsmKNk2Dxq16mx6aX5rHZf0k7X4
	pKNpZ1Bsi/7A0alj+WmkhwK8n9fZsvRfSWceJ8jS7feXfyd8lbtpqGwbTb9L/JGqo9j58Yr79pJtt
	qZ4twxep4n+Ow5oxvpqHU+AWcvCXDCnXSL3ZXtShnYQZJM/4s45BvLUTpEDsgWtdWYFFlFVsQmOAm
	NcAsg6gdOPxuoLMwHZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd9It-002DVL-0X;
	Fri, 17 Mar 2023 12:35:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd9Iq-002DSb-1Q;
	Fri, 17 Mar 2023 12:35:25 +0000
Received: by mail-ed1-x52e.google.com with SMTP id y4so19830409edo.2;
        Fri, 17 Mar 2023 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679056519;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlbqNJrYO/n+aN0q9wkJ44zCBKlY2BEF+Xu3HHvs+lk=;
        b=GvRWPpicmYmXHlmXJzdNDbj3S2e1NM1t2O+d+G4mcyTjY+RNbfyihjEQYVJCfuEE3A
         zlk5lls0IKRXAYSk+W1k4r7WAAHoNJX84ayxCGpob5VB9WjjIRAu4iokWHbfwkohcJ0p
         dn7hj23Lm2z6UssOPx44p2pRPWOb8dbf4aS4BxoFNeF5i/2klS/kLb9dLxWY0B9Mb9g6
         DqYWZ/C8CxvtQqSstmM2VXxkwKe6tg/1ZLHXeRz2GTVRHZyxRySRLyF02xn0dBT22pki
         p6JwPKDTHjKHDOEm7/jfym7V+hsH8VThTT9YTKbgj3qxoc4Jth5eU6zK1QXhz+7LL8oO
         29+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056519;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QlbqNJrYO/n+aN0q9wkJ44zCBKlY2BEF+Xu3HHvs+lk=;
        b=PAnDXBG/97wb84d4hEqApHuRH/Z537za2kXHIfsg/dy5slaJ3ZHFRzeDQEB3McBwXR
         LKoRPNr3mjVI6B/qrs8JWQlJPNMCgN1iZzz2jzhwEQAqbhqR+KcgFLwG1DxJoZljKRTL
         Rs5jsFnyb+FtGS8B1JXc3lw58T+t/L6pcUcbM9FzVsbYtftQuX3N1+eBkQLymgZ+cKcN
         0umS1MLOyROHAZIVCjrgktuv+Cgd+tyJEhGEpPTxEdJ+Xo088uHfHaiV5q9h5fS9cxwB
         wL8cDzky0LsXxsLfN42seHwjChTjIDCMPvC7QFyGQKgoJIKGP10TnQHXOxIS6wAib/lr
         jI7g==
X-Gm-Message-State: AO0yUKUG60pfRhGvGCtzdY9HkI6k6454nhhrZCgE1NtkkdC38kgYA6X7
	wgikmZ7zVIWN0L1XM8U8nm4=
X-Google-Smtp-Source: AK7set+E6F3bPV5Jt0m8BKiK0eZ6JpTKSy+WaRiCMLFnBv3jH/IifuFoXGNDYNDyEjhRp3YiSBSA9A==
X-Received: by 2002:a17:906:2357:b0:931:829c:9d58 with SMTP id m23-20020a170906235700b00931829c9d58mr2769653eja.23.1679056518751;
        Fri, 17 Mar 2023 05:35:18 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c5b8:6200:dd0b:20c2:4c96:a825? (dynamic-2a01-0c23-c5b8-6200-dd0b-20c2-4c96-a825.c23.pool.telefonica.de. [2a01:c23:c5b8:6200:dd0b:20c2:4c96:a825])
        by smtp.googlemail.com with ESMTPSA id r3-20020a50aac3000000b004fccef39ec9sm1020810edc.70.2023.03.17.05.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:35:18 -0700 (PDT)
Message-ID: <d846047f-b714-3fd1-d8c6-9f774902fb9f@gmail.com>
Date: Fri, 17 Mar 2023 13:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] base: soc: populate machine name in soc_device_register
 if empty
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_053524_482637_9BA8EDD1 
X-CRM114-Status: UNSURE (   7.83  )
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

Several SoC drivers use the same of-based mechanism to populate the machine
name. Therefore move this to the core and try to populate the machine name
in soc_device_register if it's not set yet.
Make meson-gx-socinfo the first user of this new functionality.

Heiner Kallweit (2):
  base: soc: populate machine name in soc_device_register if empty
  soc: amlogic: meson-gx-socinfo: use new soc_device_register
    functionality to populate machine name

 drivers/base/soc.c                     | 15 +++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c |  5 -----
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
