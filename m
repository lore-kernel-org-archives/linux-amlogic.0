Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0321AC43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Jul 2022 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I6Ghi3G6lgM406VvJ3ltsd97cscW2NZ2W1ha3r8K5Rc=; b=ZRDixTXijn5SRrLk4Uq9aCrphm
	KYUC+YEEBL4+p1D9eChew8iaWh5Fg1+InHk7zX+msMXmLwW/02eKKzlSWUWgyHMajZ9zvwIU+pegS
	cQaI2sBhqw+dcMY9U03xeDIorBZ/KGtZPykJCuI24N/PB/vsvc5OOrYVylQM+1Ersa0DEZ1veD+rv
	pocntNCw2wQGmbUQnlDboQFBJpGjb19QQc2kAL7uqQc7RQIvjwJD8VeiGKBtFtUaXbDgMILfBUION
	lolaR3VcDaUG9w6SPjTxoysr+JYKs4X4weOTPQwLLbS8CWUD7SogZbw4TPM4BO3/XJvcl9N9wYbvf
	l7FvuCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BjD-003XTj-UX; Fri, 01 Jul 2022 08:10:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Bj1-003XOP-6u
	for linux-amlogic@lists.infradead.org; Fri, 01 Jul 2022 08:10:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id be14-20020a05600c1e8e00b003a04a458c54so1070305wmb.3
        for <linux-amlogic@lists.infradead.org>; Fri, 01 Jul 2022 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=urfXnQFf8lee47nSLlfhwTosSVCF2VVZF7chXj2fkIQ=;
        b=DshPVdS8/FO6WCE1hdXngdZUjQaEbY1+55s56TVplpXEDl7+Gvtn3Puq4n39xx096K
         qi5eBvaxiHVSLlAdDf+QvRbM/ltjmSlV3vDgvVMPIrhumybZvYpGZdi4j6jxcKeBrKQ4
         2PA/+LJxp9cU2A5JgIibwN4N6kXIREmbPzDzVipExghhQzO5TuQdtYCo+j4jeWppNJgB
         5HZ7RZDbMlStWmKsh7zYzM0Xpqd4VFR/aYAFLHojMdkXTYOxUSAv+9WkNnRhRItk3TYe
         ME+Bh7AK+5EjKT1cdF1an86W4TK6EXoQlMQdMEWPvm3sXnOi9ZY2NBnzObdYufGq55wg
         BpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=urfXnQFf8lee47nSLlfhwTosSVCF2VVZF7chXj2fkIQ=;
        b=TnoWdaSkuDlUNh/uyxj+cndm5AiUhegnYuLTtpA35dvmN/lSOTBckBlzZlvuH2izum
         A5isfRsnjehso9ebgc926sCctASJTgvMMEkznZgf7VA2oHcGG+CqNaxa4wlW4QvLbBZM
         RzySGwepezXsRSNILOakTwAG9SO/lp0vZ+5UvsrmFD9UU7fCBqarH9JvWMjaDg9PCrtg
         tRi5Ibe0A7xo/TLiiCkMsw/msgw+G2oPBjFcYPhhHK7wzYpwtdHqN7m+2v1AzYRQ/AsQ
         RKIpRH+PgFzUkkDTZa9YrNWrJOscFhtUyvzqt4eTbzTvXd220aZMGMeug8ZOfBhvP39+
         YyVA==
X-Gm-Message-State: AJIora9SpTgVuCfEyxqjQJ5BGdtxIHlMySj5n+iSbOh90FLrmKWSDKOh
	09ae9rxJEecjByurB8OYYmSGtw==
X-Google-Smtp-Source: AGRyM1v+njBFoeEjpQR6P1UIx7Hhvceuf+h39EIAS9k/yljAVQ2mNXlCG9w8Iw5cObgn/N+IxPqDtA==
X-Received: by 2002:a05:600c:1e87:b0:3a1:8f12:8a8d with SMTP id be7-20020a05600c1e8700b003a18f128a8dmr795964wmb.3.1656663000427;
        Fri, 01 Jul 2022 01:10:00 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5d81:390:1737:2a33? ([2001:861:44c0:66c0:5d81:390:1737:2a33])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d6551000000b0021b932de5d6sm21853730wrv.39.2022.07.01.01.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:10:00 -0700 (PDT)
Message-ID: <cbf6bcb5-c7be-40fe-4436-4578c9d6c532@baylibre.com>
Date: Fri, 1 Jul 2022 10:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Neil Armstrong <narmstrong@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic ARM updates for v5.20
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_011003_324873_3D519D04 
X-CRM114-Status: UNSURE (   6.14  )
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

Here's an Amlogic ARM change for v5.20, a minor refcount fix.

Neil

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-for-v5.20

for you to fetch changes up to 34d2cd3fccced12b958b8848e3eff0ee4296764c:

   ARM: meson: Fix refcount leak in meson_smp_prepare_cpus (2022-06-10 08:43:05 +0200)

----------------------------------------------------------------
Amlogic ARM mach-meson changes for v5.20:
- Fix refcount leak in meson_smp_prepare_cpus

----------------------------------------------------------------
Miaoqian Lin (1):
       ARM: meson: Fix refcount leak in meson_smp_prepare_cpus

  arch/arm/mach-meson/platsmp.c | 2 ++
  1 file changed, 2 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
