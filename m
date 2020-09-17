Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF97FC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 15:30:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C0F2222C4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 15:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6IDa+gB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hi14w0Bp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C0F2222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Sd4dy5gH4SPk9YRSooWybiAPFI9+aC5IkXlfWtpaus=; b=t6IDa+gBcfygWYfwfqbI/acOw
	xAxUNEWbO/SPez3zmoXyGEnL5ulygpulXb37gc9rswMCKVvCzEZSecQieetzh84wBIDoFuOOKdEaG
	m0FWKZKk4x8eleuzGUNsrW9FIsPivaWVmaRGbCxUZSoYQTfNEIGQzCrxSnbUft9PF+vWov/aj9FF+
	jU1CrvzVeQlJ5bAcdxZhNcB3QVXHGTKvhTBPLGGVdxPGBqXh4HcCy0cYMfIE/44IvEspp63DmSklM
	AkVGz/9eZho0qJA3YnoCqpqecSDrVTu5a5i3z6nMbhBkX3M4YwK6KJ0iHYyfUcIyNKva9dhW7bGj3
	DNkI5qekg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvrL-0005Rs-GT; Thu, 17 Sep 2020 15:30:07 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvrI-0005QP-KJ
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 15:30:05 +0000
Received: by mail-ed1-x536.google.com with SMTP id ay8so2912955edb.8
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2020 08:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=07SZS8LKTaYb2ZodeUWOPxE0kfHN7BLiKaXydMlMh+g=;
 b=Hi14w0BpHhy9m5Rl4kH5Im6BcDSVD8iusJ9GLb+2+XE+f5pm12bIEwf/HVvQgEzHPY
 /aH/qXJlC/nvaKVugmpAd/Qbk9yLJifWVc+gWKVA0DkzuTo3blwPThnZL74eRi+WPfM3
 LX0rmxuRu8Qg1mOj9tJISqsD1O3DJuWplNAUmimUav74PHfT+8d9JcH8is+NulJkDiI4
 eEZAbj/bN1VcEHyuAhNhQrUrjlmwuN6RfiLL6v4R5/j76FgY3T+8sOogfS65tPaMfX5p
 3hx6sZGI9IgyRD56nrH4LlXVifo+yCeCaDDxqQQ4wykwA7DP4xUfHLRsZ5TsqiQjRUEt
 th+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=07SZS8LKTaYb2ZodeUWOPxE0kfHN7BLiKaXydMlMh+g=;
 b=TFaGirBzTuM3IUxTXsy85WvYzx+82vOcxRbw9Uw0oLABljGE2jPNilsRdJ7Xb8mJVg
 LSngNi67iLhSOp7/MGF3G0BI1bigqTbiQU1bKDNhY8+6K9Y56x312UM2VyrQ/Iv1qw9l
 ipXl6JmY8Vp2JSK/pn1j8tMiJEfbmChwtOLCKJxIwU7v6DHVFRJY2dePxRcJ20eCZ7TL
 u35B146x6b4g2Na7WLCf2ULSy6HHavDz7gRWyVR86h+HvulSG7D6pECxLdP4MuEtxcT+
 Q5WQzCrGtdj3ELSJfdPtxmddgZYOlrxp1KGPJcspS1m8TYEkn9DCS3EJbGDtI1fCaSDm
 Izpg==
X-Gm-Message-State: AOAM530iiplOmnPh7+BMZF/HiBmBdzMhaCAnq8oFUkXEIDsPQ9/hA+XQ
 a0uRbWfq1/d1t2jrR1Ha2OM=
X-Google-Smtp-Source: ABdhPJyq3s602CE7sjZ2otpCLH7IGcuhF1xumNeZlGyZbGxltkJ1MET8Vlz0c0Acyz1re2O3j3ZHEQ==
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr34151576edq.247.1600356602591; 
 Thu, 17 Sep 2020 08:30:02 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 ce14sm25474edb.25.2020.09.17.08.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 08:30:01 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kIvrE-0006cs-LO; Thu, 17 Sep 2020 17:30:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: s805x USB broken in 5.8?
References: <87y2l8plev.fsf@dell.be.48ers.dk>
 <CANAwSgTx9FHnueO0-K5M6kFhhWLJ0MEdcDKDnxbrwDnkM+AK3Q@mail.gmail.com>
Date: Thu, 17 Sep 2020 17:30:00 +0200
In-Reply-To: <CANAwSgTx9FHnueO0-K5M6kFhhWLJ0MEdcDKDnxbrwDnkM+AK3Q@mail.gmail.com>
 (Anand Moon's message of "Thu, 17 Sep 2020 20:41:09 +0530")
Message-ID: <87tuvwpgjr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_113004_704805_91FA5376 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

>>>>> "Anand" == Anand Moon <linux.amoon@gmail.com> writes:

 > Hi Peter,

 >> Before I dig deeper, am I missing something? Is this a known issue?

 > Yes, please try this patch.

 > https://patchwork.kernel.org/patch/11740801/

Ahh, thanks - And I see that this is now in 5.8.10, good.

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
