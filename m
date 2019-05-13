Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8103DC04AB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D3420989
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J0z3HDlV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W5DV7SrY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54D3420989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woAz5utsA9iy0/CMgFwnwp4FdsFHD9YJKezIlz3Th1U=; b=J0z3HDlVrg0Dub
	GX0s71V9MvPkAf98M7XLbkJxoQEXmhZzikEcXPPkmK2Ktsjm0Qr7QZopzzrBghwqb6rM2PfM/AsFi
	lA09mb+q/0iaInZk1pLAaCImKi6XfKpi1kInbkFv9M9+ynB18ktqZ2AVEmv0MwUsTBzIpTTMVtdfx
	N3YFqTGdrHzyCsqrRN4SWMBwDll4I0Krj5P+HWKHofU0e7IAf86vJfUuFFzh2kz1ZeWHAoFe+nhKY
	fDMrnhAHOOx/Qpag9/e6+Nq3VjzA0FOX8vt1JTxjz8ev+5q0Onr893kqGF5ueXPKnog1Ux6BsuKET
	yWQoVwajPx02aHFtR5rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ6wQ-0000zv-SA; Mon, 13 May 2019 09:08:14 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ6wN-0000zG-Mn
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 09:08:12 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 79581C010E;
 Mon, 13 May 2019 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1557738480; bh=gcTvcdOuIINVJKU6JW1SH1m0kFLmNwXaodiC6f8wND8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=W5DV7SrYvh52vMg7I21upmaOiMTjXcGvjQ2IgjMM1EQcHCZJ3OUV7SiB9vJHKQTM7
 5kk2yIwZSroB+Ums53ADIVMZKNEPvJSRngudhwGND2JahL5TkhzW2MW3cEEPO6JSOA
 s3h6uxqT9wzgL4DxNUp43gU1fUAsLwTZjxGWilRvNultOFbx9tqiUJG3svyi1Q3ydT
 l8PPzw9dCRqos1jmS5QCYdUzsfj/Wi7miPLHAR27pk08BIuP8nKzNM3jCIKZRtbmki
 QzvfX35tskHY3rLhRVFO0HkqkS1Bencj3V7c5CHkwoPHveulDNMifcBpzRldLfbnXy
 2RCS+BS4X4Xzw==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0DE2EA0095;
 Mon, 13 May 2019 09:08:04 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 May 2019 02:08:04 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Mon, 13 May 2019 11:07:56 +0200
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Simon Huelck <simonmail@gmx.de>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Sebastian Gottschall <s.gottschall@newmedia-net.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: RE: stmmac / meson8b-dwmac
Thread-Topic: stmmac / meson8b-dwmac
Thread-Index: AQHUrqr/JQcHkqt1hEeAbkJJzJnwDKXPv22AgALiL4CAAidpgIAB8QYAgAP3ywCACX/eAIABK+6AgAAAwYCAAD/gAIAAAkYAgAAFzwCAACj3gIAAAKCAgAAGIgCAAAldgIAAA9KAgAAAxoCAAAIjAIAABCuAgAAQsQCAAPZwAIAAtp+AgALLNACAADQdgIAABVkAgASIe4CAAE72AIAADmsAgAQZCACAAIQtAIACgusAgG/hBQCAAuUU8A==
Date: Mon, 13 May 2019 09:07:55 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B91BAAE@DE02WEMBXB.internal.synopsys.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
 <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
 <8ec64936-c8fa-1f0e-68bf-2ad1d6e8f5d9@gmx.de>
 <f08f2659-dde0-41ec-9233-6b4d5f375ffe@newmedia-net.de>
 <3a040370-e7e5-990e-81dc-8e9bb0ab7761@gmx.de>
 <c21c30e9-e53e-02a5-c367-25898c4614e9@synopsys.com>
 <12d1d6de-2905-46a8-6481-d6f20c8e9d85@gmx.de>
 <2c4d9726-6c2a-cd95-0493-323f5f09e14a@synopsys.com>
 <2d7a5c80-3134-ebc0-3c44-9ca9900eade8@gmx.de>
In-Reply-To: <2d7a5c80-3134-ebc0-3c44-9ca9900eade8@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.107.19.176]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_020811_753679_14123681 
X-CRM114-Status: UNSURE (   5.66  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 "Gpeppe.cavallaro@st.com" <Gpeppe.cavallaro@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Simon Huelck <simonmail@gmx.de>
Date: Sat, May 11, 2019 at 15:53:34

> ethtool -S gave me some counts for mmc_rx_fifo_overflow, which i didnt
> recognize before.

Flow Control can prevent this to happen. Please check if your DT FIFO 
bindings are >= 4096.

> Do we have new ideas / new direction to dig for ?

GIT Bisect is the best direction to follow.

Thanks,
Jose Miguel Abreu
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
