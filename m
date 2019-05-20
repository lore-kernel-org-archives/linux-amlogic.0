Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E12C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:56:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B282206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZIcAk7h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FFBMXcML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B282206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/p+aoYW1KSBoV3+SaJsLgXccwM+ayPYjSnITsmtSes=; b=jZIcAk7hDr/jSO
	qJPdH6JFpat9u/plTtRW6FUNCqH7YvcDQNq+MfU+p6a9Q51cr+E7ku5JU4UevZ66TQfem17GgaF7/
	uDmy3nZF3Bunj3wQri2q89M4C351AyiF8C/vqhuBn3kZXNenDdlZcCpBLrJ0I4+yHiN1yzVmxvi9h
	uUdJUTW661SQ95QXBmMT4CPjjdY9dgxrsPCXVqiyvKt8xyY5FLhNhWcf+1+rsdKOdkJ1BN0TYhcRE
	uB7CoOWPuwYurU7jQAF8QVRnTQunFOe2bMlWlLk5u7ip3bSKjRAGhXH5DXV4b2pvpRKrHOHJpTIr/
	qzmgv6R9atFy55ielFeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmWq-0000Ay-VX; Mon, 20 May 2019 17:56:52 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmWL-0007wE-TN; Mon, 20 May 2019 17:56:26 +0000
Received: by mail-oi1-x241.google.com with SMTP id f4so10695619oib.4;
 Mon, 20 May 2019 10:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rnU52g/boLPrvaC7Lk7YTaYbB64jJRa17WqE6kdu0io=;
 b=FFBMXcMLzNQ1W7XGvBM9mrCG3uVVPv93UM2jJ2cU+Gw8mB8DsEWLGIZ5crVU/MgG3q
 NBtAiyHJzyZYwwN3LuPEgk9mSfzk7vx+TK9tTUD08Jib3KeaPUiCSyHkhSQRdZ/1DLnN
 VojNvk9xjunne3HmOwSHC14iV9wXH7QkeFxPPI2KXYUpCrs2L54hgTReRWBG1+b5FGtZ
 d4G1mrXwamY9ASM9BbFsQx161dlXrNUEVTllEK26AWjR6a8r7cvgG/HttBzkUop6Wjbz
 JgKKmhFKLeHY2AJLlzf+SSS6fIEYuKRKtsIbLix6wDVcdbwrKTgOzOyeB/kKbouE5Lgx
 A+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rnU52g/boLPrvaC7Lk7YTaYbB64jJRa17WqE6kdu0io=;
 b=MP3mm7PMSR2kvA5KKqFd58XiLlM6fCG4n5bKqLQ3NSgxd20y3MymIfJ4J2h754swpF
 Gz1lrvqomCrdTO8n4jmpzIWnQD4pyVdb2bbAdM+Xgosq/jYMik3xXYo2yD+Oe124GnQr
 lQ5TR56Ja8GCKBGnZh4ve3yhfUpKNn7pilWuPicslytSjz69TTsGWR/YySvVnOB+1qJZ
 kl+fIxj8UEkx9mlfySoZVoNIbFmpOZpBiZqkHufM9AVXXEk392/JBtp/BE7CsRpZJBkL
 KPArRmzV+EDDi740CFfAxI9+ii9lyEed4r2gbye90+GXfnwe/M48NT/7iXpGmCSMzMP8
 d+KQ==
X-Gm-Message-State: APjAAAWrRo5QX3CDreN8NkkzWD+3yU+qu76nuI6IAT/M7w9L3AV6pJld
 0o3QcUDVVmdp5CHKcqGgKNre8MQUQbCiODelKk6AYDeWbgE=
X-Google-Smtp-Source: APXvYqyYH9R8huiAm/sim5hyCyxvmrJ/DVQgqqT7xw5knwKVl9Xw27/gO6Y6yWwwoU8cGGh4QN3DWSKazlrf/z3G1ig=
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr303830oih.39.1558374981038;
 Mon, 20 May 2019 10:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143551.2330-1-narmstrong@baylibre.com>
 <20190520143551.2330-3-narmstrong@baylibre.com>
In-Reply-To: <20190520143551.2330-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:56:10 +0200
Message-ID: <CAFBinCD2zLRMJqdq=1S-i_KogpXv01eUd9gNR6RsSOggUBN_0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: amlogic: phy-meson8b-usb2: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_105622_498775_5A4DB62D 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kishon@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:36 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
