Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7603C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Jul 2022 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9XLui9mbXYAzw1TMMJ8V9V4nFX3YsqZ/6k52ScPG53E=; b=3xTAe9WSrI2p9HN/RmujmZx0D1
	DV23/I9gsjLkX8bHCwTP/XE9W9HAkG54trHHGbt4IvUXoNFrMTugwiMtDAa2wBTn+KflrsysSNmUr
	Ul4uauyehGCfeFZrf6YaxfnNCQtssBJ7oxqyM8qm82S6C4yGa12laQyM5S3wOffOAvYu3aI39aE59
	xF4RQsfQJrJSaQzEIdPxkqxEjPkrH1wJWszUro3biTDq8ed6Qx0p+rudenmjuFT1cbZLYz8N5y7qe
	7R5lOREPI8Rqz/BcXJqPWSkvTv66ViUQjwEdV5153U8Ro1vTpD1AbkyMQSMT9r7pa3ANHTnMnRNhK
	9egScP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BmH-003YaA-DS; Fri, 01 Jul 2022 08:13:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Bm5-003YVi-KE
	for linux-amlogic@lists.infradead.org; Fri, 01 Jul 2022 08:13:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id k7so2006869wrc.12
        for <linux-amlogic@lists.infradead.org>; Fri, 01 Jul 2022 01:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=HwLeHqQPElorq6Og4+tDk5X+T/oy7d1KKsj0RbH81C0=;
        b=bHpxrDi1joMTeaaiFVPtfffheyCyKXceHc01tC7INBxAwFzceWUHhun81DYtTa9wtU
         iG++gTdkLzV5Is+3J1w9EdVAfHBEaBIKIeceQGSj/Da+9BXcTFnhxdbYmEvszBh5koyq
         T1UtPlD3n0gidXyNDEa82gkvBMU7z6D00g7wY37iQoooQPgFuVOZsB6l+ZP6M5fivgcT
         DdgwN+EtmSzPi9ibYiu9NVQ7meRhcx5tHTAQw7G/AycI/hGW+ZtfFvzK2J49DzA/fwCJ
         yf8p+C1XR+RF3IX4KE61huNIyLo9cXVF7Hewejjp3tk+3+yHT3SDFJzArbOdXtl38tkP
         G3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=HwLeHqQPElorq6Og4+tDk5X+T/oy7d1KKsj0RbH81C0=;
        b=7x6Z2YXvFya4KXZO+UOBVo8KRs2SkFkyzfuzVNNAWVEgo/VobGmUXl1An8YNrpBNLh
         P3zGQlwRPfz2B0Hby/TUrvYvXbE0nnm2XA/5GaADze0xHjWLrdVvfNmiIZ19SDz7tqCB
         H/MZ2uUYiT91ZE2OTtRkRRZYokZ0uHy6wj6QpaWn6I0XZXCMeCVhzIXrzNsddHP69Itc
         XMjF8x4fCvCwUrgKVyPOHdp6UKaJd45/R2uPt4NqIcEN6WKjl26Cjq+w8nx3eufJ0UIO
         bd4UANQ8fBYKnN2ayS0PVoh5O9txsg1j10GzRBLhayPUlcA/MadPMU7CTSLKGaZrXXvA
         IBkw==
X-Gm-Message-State: AJIora9ze7Y/malaHQkCwnIE9I0fPbGzm2gIFAPYIOO62GN6sf7XRhyP
	vO7ZAUx+qgNF3zoIdJEYmDdscg==
X-Google-Smtp-Source: AGRyM1u1BN7zw8isDhjU7X/ZJVBot0OFEjFkwjjXd3OlCtR6x02MDz3OAHse4yhY6kft5WsjdpDIrg==
X-Received: by 2002:a05:6000:137c:b0:21b:994a:a6e1 with SMTP id q28-20020a056000137c00b0021b994aa6e1mr12452993wrz.636.1656663191377;
        Fri, 01 Jul 2022 01:13:11 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5d81:390:1737:2a33? ([2001:861:44c0:66c0:5d81:390:1737:2a33])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d448a000000b0021b8c99860asm21771427wrq.115.2022.07.01.01.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:13:10 -0700 (PDT)
Message-ID: <0c01e173-9abf-69ac-7882-e6ecc3935c33@baylibre.com>
Date: Fri, 1 Jul 2022 10:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Neil Armstrong <narmstrong@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic Drivers updates for v5.20
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_011313_691123_E0D5DEEA 
X-CRM114-Status: UNSURE (   7.87  )
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

Here's a set of Amlogic Drivers changes for v5.20, with refcount leak fixes.

Neil

The following changes since commit f2b03c1056ef5c0829678f51273eace3e6327884:

   soc: s4: Add support for power domains controller (2022-03-07 09:40:39 +0100)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v5.20

for you to fetch changes up to d18529a4c12f66d83daac78045ea54063bd43257:

   soc: amlogic: Fix refcount leak in meson-secure-pwrc.c (2022-06-17 09:40:40 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v5.20:
- Fix refcount leak in meson-secure-pwrc.c
- Fix refcount leak in meson_mx_socinfo_init

----------------------------------------------------------------
Liang He (1):
       soc: amlogic: Fix refcount leak in meson-secure-pwrc.c

Miaoqian Lin (1):
       meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init

  drivers/soc/amlogic/meson-mx-socinfo.c  | 1 +
  drivers/soc/amlogic/meson-secure-pwrc.c | 4 +++-
  2 files changed, 4 insertions(+), 1 deletion(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
