Return-Path: <SRS0=6t6z=WM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697B5C3A59D
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2019 20:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5082077C
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2019 20:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NbHdaewQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ryl/jnO3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C5082077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpZnRV/BpXDld6TCIUOeJU1C07GFiDQ+6FstPgFnuHU=; b=NbHdaewQBQloxy
	gNUV3tuRaEtGxKlMtJDQzPx3W3wFdeO15CORfl7ObDfQ+fjz4Bt+l9Q343Y9MirbahfYsxznYTNCk
	u0d2RLppQDoBpGQvGLkjd4gG3vdPCHFEfA0gLwpeEryXLANLFBVe4/Ym0/7QEHPsDyL/6vfwnMgx8
	HPdQ7Sm4aN3a3hvQ5qvJyP2aIfP4awSVApwiJ6EHOobr6e5ZXgMjPTEQ/ve0zFF9MbJFIB7eRWiBK
	KbjacPiXU90im4cNhB8Uj4Th2IlMKAcwiLZLHLB/04ae3wx8L/lxfEUQtBh9TDqgC04DqSgRh64ic
	eVAojM1mN+vh9MS6BC3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyiQh-0006Ge-1U; Fri, 16 Aug 2019 20:02:31 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyiQd-0006GC-FA
 for linux-amlogic@lists.infradead.org; Fri, 16 Aug 2019 20:02:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id o4so4933115wmh.2
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2019 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MVcky00cL9Izjkmq24TTUY3wBYWfFwCVX+CmLNIxHAc=;
 b=Ryl/jnO35VzIc5OmYxSXuX9ZOHwWKrrh9/XKBA2mrIEy6dyJKxcqnc9KP1rmtfbg5z
 +gBgpfQYBWg7tNUMj57KQI+nD27aRFeq6ixsxCONUU849JpGxOBTCrNAR9d/+bnrBchU
 j6K5+0GosP79nhbWtKcE6ExLoSscvu6msxmMAzD/6ovYoPckNfL2vSsN9GFmdYQOzngZ
 t+1zb8DH1QwOSR/cJnh3DkiVU10/fbaXNrP96VLCdg29vIPrN1ILvMlNiisy5PjfuMz0
 pLALKMZZ0mBt3VR0qV4t+WPly5/vYX9gngoJqkHoPRWhBlwrESh0aSDvxKe3a/1J9nJj
 CtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MVcky00cL9Izjkmq24TTUY3wBYWfFwCVX+CmLNIxHAc=;
 b=CXlRcFWFYLue22gbr3CrsO3KNrcBt0VsWOwlJbW/x0ZQsFQa4Ic0YvMGS7E8RedcqR
 ur3Ui9HtkFANDdTQq3Dk6EBLPv1YX3eVfUcJtvte+JEivmm0k6mvvzovcfSEJRV89WGV
 /Fj+5gdcmWgAEnApoecGQrk6nd+/6d1jNyz6/m6nf4cgkJWSdyZDLZUOwi6wgR7zIgV5
 bw79gjUzQm41o4u+zvf5v5PEeEPQ6h2IffvrrAemQODqVYPqDAqF3u0W1KyHvFf3PMTK
 7EwN3N21EMOsf4idJhgF5/IAPGTEebXtheUlkusuA8h0KnFE7b4fdo+80VQacdtvRpRu
 4sUQ==
X-Gm-Message-State: APjAAAWzF9Vr5dYBUDZZg4yFwGQJAiacJO7S+P0dUsL9wGg2cH1yNDIu
 IIfSds6f3jZiRsCIHo4Nj88a7+33
X-Google-Smtp-Source: APXvYqzcYrIDjzKdpiQ4tI4a5N55fRtIJCU5ASVcbUwgQs7l82l96u+O+kkNkpM2rDgx/qA1ozKh1A==
X-Received: by 2002:a1c:2302:: with SMTP id j2mr8505269wmj.174.1565985745527; 
 Fri, 16 Aug 2019 13:02:25 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:4112:e131:7f21:ec09?
 (p200300EA8F2F32004112E1317F21EC09.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:4112:e131:7f21:ec09])
 by smtp.googlemail.com with ESMTPSA id z8sm4295465wmi.7.2019.08.16.13.02.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 13:02:24 -0700 (PDT)
Subject: Re: [PATCH net-next 0/3] net: phy: remove genphy_config_init
To: David Miller <davem@davemloft.net>
References: <95dfdb55-415c-c995-cba3-1902bdd46aec@gmail.com>
 <20190816.115754.393902669786330872.davem@davemloft.net>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <7ca48c8c-80d0-7abc-c0d9-f0ab7f787f04@gmail.com>
Date: Fri, 16 Aug 2019 22:02:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816.115754.393902669786330872.davem@davemloft.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_130227_511806_A90D19CA 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 vivien.didelot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16.08.2019 20:57, David Miller wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
> Date: Thu, 15 Aug 2019 14:01:43 +0200
> 
>> Supported PHY features are either auto-detected or explicitly set.
>> In both cases calling genphy_config_init isn't needed. All that
>> genphy_config_init does is removing features that are set as
>> supported but can't be auto-detected. Basically it duplicates the
>> code in genphy_read_abilities. Therefore remove genphy_config_init.
> 
> Heiner you will need to respin this series as the new adin driver
> added a new call to genphy_config_init().
> 
> Thank you.
> 
OK, will do. Thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
