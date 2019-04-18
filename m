Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD6EC10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:21:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A5820869
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q4i9+nag";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RjgAPfvZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87A5820869
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKpqE/vm+dbmGa6msri0oxsQm+Y76hBT7P0FsleKQcg=; b=q4i9+nagV3OYPi
	twmGSOSwjqMKv8Iu0ZmU6tcyVvvYeQvLNraWHUgjF5FIdDi2YX5NEGNUQk3q35X7FQ80jJ+3F+/DB
	vTpAnkXC4gkDBQmjM6N06IbsnSkB4HoAv7RjRrPdXFheaNJOsWOj3NrLUJwXxE3V4pEL361uQkttU
	JBTf8SOIjFdVFF1QLIu5I+gJEuu22qPeUZrN6utrbwt3iipc7DzUC6kjQ/aKx/RiQqcTU0ENwqPJR
	O+Iuum7mjcSpJC4Vz2Qry8/TB+OywT10irppaO4bQi2W0LiBIrzu27Ch73T3WUphySnxFCv5BlWCR
	ah0+yxVNtRAi4XVEQRKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHDXY-0005Dh-JW; Thu, 18 Apr 2019 20:21:48 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHDXV-0005Cr-1o; Thu, 18 Apr 2019 20:21:46 +0000
Received: by mail-oi1-x244.google.com with SMTP id j132so2619575oib.2;
 Thu, 18 Apr 2019 13:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vtGQ+YEd9cFM435Y4nG6uPQp+65A7CRaSBJF8Tu+rlg=;
 b=RjgAPfvZR4pQdg/P2es0HvdZ8Zt6/zmfZjbXp8pdapFsXaBFdOhEdUWSmoUFEj8T5H
 SOBhKgFOc5iOhsaSyAidTlCHN0rVFR0y8D1MWPg1Ay8SjrF/gV2TZ+40mDZr0KUx4/eN
 FINAJD9jIcR+Lyph6rO/xRRgnSQoY7EjkOJXroxIGd5lDyMrnmjJnQHMj+Wzk9GUg6PM
 vuctQqUVpCS29vzgIFTDMImgA5TfDlaLLI976J83QAlQqNGiC4SZ7XgGVbZyHCP1Afm6
 Uv9WpnNWpP6snYDC6VJc5Gcfs3Qw9NyRspVFpG453+odRmJTEuJkRgmDUqRiy/rfoFAD
 cjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vtGQ+YEd9cFM435Y4nG6uPQp+65A7CRaSBJF8Tu+rlg=;
 b=sofGlLtWXBgutUCqV5ah/Utt3jo+0dCp+HxaU6VNhMRCR4bJZXge3EFIhfM37huypw
 zazNmFUlBm4/HCMZXOA4yg8EJu0Z6FzdSlh2bvLqDGFX6wGXduRCHtkgHppG5HWQiLDS
 ueOoqv44LyT9tTKarghpe7O76BDOJqarkLtb1to8eWBgYoFla+WCs14sumYNbqUz0Wb9
 p3XIqr7UrmDaNtvsdjBwjsNDln6799SFdC6FEOehcCoDkmNqiAy4w9kqtvz5pHDjVKIO
 +B3sZm5PUx81Eg92AkHc3mSpOW1PfCa3cdbDCbudvAL34Npkx+tn2a+sdtOH2IurUzFq
 kKlw==
X-Gm-Message-State: APjAAAVQnaIqeDMuAeWt80xLNJUxGi1cEcDq67e1oeYt9dYWcFCLowrO
 nFIMcxzHbOmGLQUf8JSfGs15e4OucPmG2AOkvow=
X-Google-Smtp-Source: APXvYqyqGfVor5eXCaWPuNwHwDNeH/pBygTjaatZU2W9bXgOHtwfX01XA9J2zLcwKfgcdeR96LZUMRy5JBD1WhblRVc=
X-Received: by 2002:aca:b68a:: with SMTP id g132mr3314934oif.47.1555618903942; 
 Thu, 18 Apr 2019 13:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190418122714.30805-1-jbrunet@baylibre.com>
 <20190418122714.30805-6-jbrunet@baylibre.com>
In-Reply-To: <20190418122714.30805-6-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 22:21:33 +0200
Message-ID: <CAFBinCBtMbokg_Vsn4Q8Pc2q_hW-v2SHxg8qjdMKwCM8k3myAQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: meson: vim2: add missing clk-gate pinctrl
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_132145_097800_10E37EA6 
X-CRM114-Status: UNSURE (   7.01  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 2:28 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> For some reason the vim2 is missing the clk-gate pinctrl setting all
> the other board have. Just add this missing bit
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
