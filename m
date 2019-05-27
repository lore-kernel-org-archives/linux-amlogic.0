Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB679C07542
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 08:44:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02312173B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 08:44:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QasCYUXt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02312173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsOvnOYO9i0z7TXyZZ1bzkYeco63pKf2a1J2vGwS4OU=; b=QasCYUXtBFzwP4
	xa4CiUsnMkGU7TyjTAe6BtCiCN8KpqC2y52Ri7acQEWjj0B+lO4tSDLbAuZTMNK9VLQdJW6npgULm
	yC18S5O31ETeVrfw1S//q4PwnTON0UWwqLEMRKzov00C0o3h6KAjOSmlKsxxT/Aiz3zgS3srzhmAt
	8oRYh0+maFUV6yNW2qEue6ngYFDji3tdi96yAn9X9qBb+j6PIdS60IowgUjlFvq9G7vZcjuph97yl
	lt1VkiBt8yvHo9yO86h+Qs8nyM+6mW6sSsMk5qSnvWPmvDhUQR75KCV+Ln8lPMHyZcX+Cy5NI7yTG
	8OG8wHGluoyOnpd1FljQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVBEd-0003jy-BV; Mon, 27 May 2019 08:43:59 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVBEV-0003cr-Qx; Mon, 27 May 2019 08:43:52 +0000
Received: by mail-ot1-f68.google.com with SMTP id u11so14141786otq.7;
 Mon, 27 May 2019 01:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SPyeTzPFoh+1jcHD1T6EeO+I9ugNzJgCyHNSVSPB+Tc=;
 b=QJuQ8/syzpLmsCJPuIU7wttxHmNLIAPSvEiXFe7kUWGlxL5RbzlEAaAkFBR7Fy/ESz
 MKLAlogucdpUXzwSaWBFRlj2T34E+zLSOI9/GdaQhG/5mCZDfU4HQlKlhgeJ99C5EpIz
 x7Tnm2lfPPafvek7PFU/SHYZ3I6Vxbafa4cgc6E7YEivzRmjeKxsRTYyFJuS+/F10vXR
 aEcOi4sfPuTe9qIi0siq+ulW93s8E+NxU9f8S0u0MMzXJu2JjeyJrJ3sDr7cOoZCOUmf
 0ep9U/wewS2k3HqhH11e2+6KUZLk5Awm2CsjVBukZMt12bAvRtTM26uPjPvCjdauTjjt
 3GLg==
X-Gm-Message-State: APjAAAU6in0/4v0BhoJnXrRzz9YYqXR9oOD3C8F1amOKfmRI+lgCMSfy
 lazTHqSz6SXzve1msqfjEBVUcoYhVFV3aaMm9bY=
X-Google-Smtp-Source: APXvYqxIlLFH84yhUFerMj/YlUDBNDBRTGJTxhPDFRXnfvuo7mYZbz39ugxbhoZlfat/iRijWwRpROWfadWrjYSeMCE=
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr43860970otn.167.1558946630255; 
 Mon, 27 May 2019 01:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
 <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
In-Reply-To: <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 May 2019 10:43:39 +0200
Message-ID: <CAJZ5v0iiSo=yoyZTt6ddf5fBRGy1wSvzmA-ZaHH33nivkSp22Q@mail.gmail.com>
Subject: Re: [PATCH 10/10] docs: fix broken documentation links
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_014351_875024_1AA7A767 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-i2c <linux-i2c@vger.kernel.org>, linux-kselftest@vger.kernel.org,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 the arch/x86 maintainers <x86@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:48 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Mostly due to x86 and acpi conversion, several documentation
> links are still pointing to the old file. Fix them.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

For the ACPI part:

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
