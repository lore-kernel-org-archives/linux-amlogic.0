Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BFFC3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 19:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD1020679
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 19:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fz6vnad4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DUeUltup"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD1020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtcHXdMcMJgUQDoKYIZ4zwk+0hnDABcNVpUc/qkHwj0=; b=Fz6vnad4CHEvlk
	yaOWzj7Qw3Fh5A0MkVMExbMzuWA6w4OTJpQxsCDL/keUgLuU3d/hG4X0yNyyUmnARckdY30hXRcUm
	+656WobRqab6jakyAAn8RLC0KUSOhfuVgNNXtws8PBS7m6aPakuq248nhetXyZfuB6Hti0/xBmWtj
	JgJcB8ICPznB8WcxK0POaTKSEElqBcYxQzsN8fsbATLjz1VA4MihNZ02zihkzNBD1KkI2fGpyFkJ1
	dBqJApHvSL09AEAPd7m3j6vb1cjH/N7Kji/wd+nKq0usMaqfTzP9mjWSkuTMscj3Jy6IZNbUeFXTJ
	oZvckwV2JhpUGqCaY2qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1yOH-0003Oq-Mf; Sun, 25 Aug 2019 19:41:30 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1yOE-0003OA-Tg; Sun, 25 Aug 2019 19:41:28 +0000
Received: by mail-ot1-x343.google.com with SMTP id w4so13253327ote.11;
 Sun, 25 Aug 2019 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qlDDkamxbX2r79L95zXK7WbBhhFB6AOzHAQ3OS8ilaA=;
 b=DUeUltupltLo1VWEITJxKcTkvn0FfJzHF252Zzj4GMZuQU4CwHodqhgKhFAckUu40/
 B9ZjxStjhQTI8+io8lhcYPKaTrlnTIdCRQa3DtSo2RgUOpJZLQ2kntUWzRUOpqKlOpeo
 yHwCrp/NvipwcmOCGDcJbzhnctT40seWRQOM4GjdqLBgP2X6GL2WtuNI7x1sET4haHdS
 kpoOcQyBOd7ef61l3WBdYsiNnQP2heTxH5we2W8mICV3PizL0b1g3mRxMo4kgGgkVtOa
 7/uYj/ijstBI548EDcA30s7K3LwtTxLmSQxzs4JQzKYczkMXY/YrrxmmU0HySPOqZooJ
 T0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qlDDkamxbX2r79L95zXK7WbBhhFB6AOzHAQ3OS8ilaA=;
 b=OtXRVDWA4/nrw3/DaExwcPwM+nhuW59zwXO+/72lR+OaQsSRAR8LONT+d4of9V0p5Z
 UG9LpNMMD9UpGUovwaBUv+35T4NH/3ooWl2opCZjAezvgytHT6ATozB/ziK2coMEyUl2
 Dt43jYH3cMpteQv5sVxjI50ZYiaJmhD+tIbdbOtPLMTmq9c34wOfM09RlAGLd6OcOtTJ
 2MAwKSPQWpLy/eo5hT3BZAyIgx7BWy76+rR/2QMJhNIRBYP8uDpAeUWWAPL6RZCpm0Bx
 bQ3fGzm/RhqhtUvOhKYMtC46pwPodNygelRwoLw/ssI3JaurRBbsgNvu0CzXsXdxE652
 VmRg==
X-Gm-Message-State: APjAAAX0xvjGlWopu0uOV/rVjN7xxQIRQvy6V/l0TBPn7gNVhX5myEfs
 882emMlEW6XjKlBSJOes4eKrMnLj9wTXwHu8OW0=
X-Google-Smtp-Source: APXvYqxBvjkhxpmOWOLItNdm+J17A0188tF44vzyDOVXDo45nvGlddvvK9NIUw2Z4JdlCBImzeuT+hKRST3xC9eJUBg=
X-Received: by 2002:a9d:1d5:: with SMTP id e79mr12390982ote.98.1566762085291; 
 Sun, 25 Aug 2019 12:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190823081427.17228-1-narmstrong@baylibre.com>
 <20190823081427.17228-2-narmstrong@baylibre.com>
In-Reply-To: <20190823081427.17228-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Aug 2019 21:41:14 +0200
Message-ID: <CAFBinCACwWqMGDJ9R7f5D2YhyWz7n7UgH7A4fJbkAp2drKC2Kg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: khadas-vim3: move common nodes into
 meson-khadas-vim3.dtsi
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_124126_963372_C99FA589 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 23, 2019 at 10:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> To prepare support of the Amlogic SM1 based Khadas VIM3, move the non-G12B
> specific nodes (all except DVFS and Audio) to a new meson-khadas-vim3.dtsi
out of curiosity: is audio because of different routing on the board
or is it just because the audio driver needs more work for SM1?

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
