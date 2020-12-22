Return-Path: <SRS0=MUs3=F2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30860C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Dec 2020 17:25:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB05223133
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Dec 2020 17:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB05223133
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nziSYki8SCphhR7EllgAoTCaa2mY2jepcGY9EN/M3s8=; b=t2kE4zvP8GM595BrEkt9OGiox
	o7/Mjyp2Vix2gnPE3l3zCMKcULfm5qJtilCUoHLFmd31ouiBY32Aa+PA28gAvDBMcg3iiSYisITRi
	m+8QToSjsJgiiPoSrWG2hkAfsMbi7GBJbyyGQ4UWWzu0b8c1O68hkDsgTL9uDSr7UXiDCG5+CEnpV
	dPtHUlrfeCI9jbx51VgLEOBe3A4tol0FOYRgrNccu+OwfV4KkU9WB61A1fr3+ruJGF9CANMBYYXsU
	zzi/9FLjiGK33SXDiV54NZfwsYzIvbEav94O1Kp5tXeSbOWiVcRWaCHqjTSvbYFRxfDQheEXPLw49
	AYnAq5vZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krlPH-0007GC-WD; Tue, 22 Dec 2020 17:25:08 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krlPF-0007FX-0h
 for linux-amlogic@lists.infradead.org; Tue, 22 Dec 2020 17:25:06 +0000
Received: by mail-qk1-x736.google.com with SMTP id c7so12566382qke.1
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Dec 2020 09:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+2uK0bNHYrwMpWuzQ41ZoaSBINguN6e6J9Bu8gfw5lY=;
 b=aKy9tXFmq5dJ+NrLW9xAL+n/OzSWvcylLxpquiuP+pY5bD0E46S36vQD/TCXdtsqR2
 AlvW1e+GUgNXmnFkwrAbXDNmN+lt1jaGl36kY1P74JTLOrGSNexw6Lgbl+6WLWpg88UW
 xkPtDk3NgqKVpm4RhyDOluuG678C9BUDAb3CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+2uK0bNHYrwMpWuzQ41ZoaSBINguN6e6J9Bu8gfw5lY=;
 b=dbT0zT8CQWm4d6MFUR4M2/M7gTLYcEITmLcV1hLWqKMeMOto2raESvRpMcqcIafjeq
 0LbuUvLgUrV9N7kANHeKzLMaJlbMKevhuCB5NAdzzi4fAtyTzgTxNyNSmALMVy425rgj
 mFmwKCt84A9Ee7TU9se+P7W8fOGMr3YDBZ1Y3JWRMnNj6u64Zbf5TYLM1SXb1egxjhq2
 5Ipj/d+od4vFoYwV1Y3UyPCpgvOWbz2rA9/145kfZykRX97yLDHbHaheGjLKbni8YsRf
 yWYktQS5sV1Jqy2VxUSqY57cytnwIMOMDhoTAy82aQ2wwsbzhJjFXzPH/fmOnfoy82Jk
 V4tQ==
X-Gm-Message-State: AOAM533QioR4BT12EAYeqt2vgOGopyIYp4jLlUV03eZTNnmOmMw4hlmn
 PTrf02TLkjzH09hA7hG7FWFHZA==
X-Google-Smtp-Source: ABdhPJySxVXHrvHzRhRjuV9lreRVgmzfIEoOnaX375JPzPBvOJ7ILwYAYNiVoWiy9tHHqHuc7Hrp1g==
X-Received: by 2002:a37:6c06:: with SMTP id h6mr13373371qkc.115.1608657901072; 
 Tue, 22 Dec 2020 09:25:01 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
 by smtp.gmail.com with ESMTPSA id e38sm6708882qtb.30.2020.12.22.09.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 09:25:00 -0800 (PST)
Date: Tue, 22 Dec 2020 12:24:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [sysadmin] linux-amlogic patchwork not showing new patches
Message-ID: <20201222172458.dfuqmm7hwhjqs6th@chatter.i7.local>
References: <CAFBinCAdq59k5wY_K+_NCxx-PLrp+eAsfOE1jkj4q5TFn7ruEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAdq59k5wY_K+_NCxx-PLrp+eAsfOE1jkj4q5TFn7ruEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_122505_178210_B0721500 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: linux-amlogic@lists.infradead.org, dwm2@infradead.org, khilman@baylibre.com,
 webmaster@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 22, 2020 at 05:45:19PM +0100, 'Martin Blumenstingl' via Systems Administrators wrote:
> Hello,
> 
> our linux-amlogic patchwork [0] is not showing newly sent patches.
> The last patch showing up there is from December 3rd 2020.

Sorry about that -- this was missed during system migration done around that
time.

> Mails are showing up in our mailing list archive though: [1]

The upside of the new post-migration setup is that we feed patchwork from
public-inbox archives, so nothing got lost. All messages received since
December 3rd are now in patchwork.

-K

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
