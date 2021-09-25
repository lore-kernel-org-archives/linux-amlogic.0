Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD58C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2689760FED
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2689760FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzMfUDyxjhBBTwXpJwbt6gUPDy6Ke2sY9ac/rote6FM=; b=kvJxm6N0IBFE2j
	6rpitYRoSav9bCzOblZZdi+whMKDw+CnUIJEAv4dNbTdEOXccQRdATVfAheG+o4FmBIGp1/BAyu7q
	AfwwEak/GbKf+Ntt2ma4J5AxLWxVwRmYB12WglwSHcREJrSceixe8uY60IQMIIu3PVgV9qL86Pk4d
	rfZ1UKAT+Uo1q/T5+RorppFjkhTPJVCPXHF3a0fFu81MbAxHUkNMVC3dN5qrHiyfskLJ1qNeELKkz
	npcUb6EbyBIJvr2M+trJwdV4zdlCdqo4/UVNeSbAgdbNYiGwVpdkjQLsSX5lSeYefr+GYhqD8h8BL
	xN62tbJXq9XiWUznTcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUB8L-00GwBP-5q; Sat, 25 Sep 2021 17:06:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUB88-00Gw9A-Uw; Sat, 25 Sep 2021 17:06:30 +0000
Received: by mail-ed1-x52e.google.com with SMTP id v10so44709362edj.10;
 Sat, 25 Sep 2021 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kmui+08NXbFT0nLrvdY1BcuEpj6U8FJtaRHyjNLMkbA=;
 b=X1vU2O/fMuGWIQr8sO60x4m4WHXkW0GxW5txZsHtd/Zx4KqWWIefwro5FAX5CkHJYm
 7hdMkOC5kLrAlY1xk8W6Qo7v8w0rjyiq7WGw5Lijh/oM5AnWHsfhfXsBCkov91zV8fIz
 +MEqh1mqE3iINMKCl6SJwktVYwIh9CQZVRGXO603RrbLr0ygp5RSfgA61CQ1FdmPGNjc
 8sY6G/mJy/s6J2Dk4jAlsFExUc8cfGXQRnZmZ7rIXpr9L2Z6cTPz5i7z3Gfq1OgyQVH2
 sWRoGkf/BT7d8dz06/ygAK895NwboYDW02SkHm9b9JQSSSv+Ip+EMja4v8jqR0EVYQCo
 SBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kmui+08NXbFT0nLrvdY1BcuEpj6U8FJtaRHyjNLMkbA=;
 b=kjVRRmLGqhzmozR0zLNQjfHstohESjR+rlAxi8hjb4Izn6uQjRMsDGE8/zYl/YWxwU
 OAN12JhslTUQKoUk46XgirqT+/bpLNnMgLjfYEkFIvmfIfAZjuGM2Vt/64AZZ2caP5SW
 8EP7v9fva9OPMevlimIRciQpoGuX37V/UDkJLURmXtna/Q5g5pLXXiIUyT8eOMOADbib
 XwYdNOK2+fIoFn5IWcqtaP7XhEEirfGSEbhT1xK9XZts0KMt3G/k/QQuv93/BExlooXD
 GD5SPXQ7UHJTWrwlkSdSQAn4jHri++RO02AaFHtaRN5QSVFnm3driILl/PtIvOZXWoY0
 /kGQ==
X-Gm-Message-State: AOAM531HwQr7WCaxUOcxbF7rbpk29aKr1iWBhO0IFs9mxax56MqQZu6l
 n8lqDsVgi9MDGq4BVM0mgCQHO9dgzR3Nhx2SurY=
X-Google-Smtp-Source: ABdhPJzrY8tMFPHNGE75+mTiVvTPrwW84zeV3b5rRuTKD9rGRN+lbs2VxC0jPhBb0dkobrhLqii4p1oNJfeFWWGh+Ig=
X-Received: by 2002:a05:6402:493:: with SMTP id
 k19mr12301396edv.386.1632589587538; 
 Sat, 25 Sep 2021 10:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210924231242.144692-1-colin.king@canonical.com>
In-Reply-To: <20210924231242.144692-1-colin.king@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Sep 2021 19:06:16 +0200
Message-ID: <CAFBinCB0LOJvCuhtX7EFk55a7-gUJ_P43iuOLB8qeTkZGgEmBQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: Fix spelling mistake "Unsupport" ->
 "Unsupported"
To: Colin King <colin.king@canonical.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_100629_038468_2D32C49C 
X-CRM114-Status: UNSURE (   8.17  )
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

On Sat, Sep 25, 2021 at 1:12 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
