Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CC2C54EED
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 21:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKjzq7AAjqFByxW5hvhTlnYiJ6e9wayvc1ZA2aqforY=; b=xz7MR8pOO9DNt+
	KOhSqnsAwU7KanGRPtnYemKA4MpDWgnj/G5PNhjDEfo7yfW4wtHG/LImpFPJlsV25zlvw8NrTjE3L
	c8m76ncbTPWCGkG5nDBlAnN+F5iOrf9LxWPuJ5DRA1+Z+jLJjHgwpA9VDLVQob+kRDvd3fLQz8SXd
	yRNGx5dF6xZhOwk7DWyvrWw0j4Cw7P3bf6L46iqj+1SNfCqleJ1r3DtoWz0tgEEL/YhQHBtMTq0zZ
	effxtUfhI929kzSo+nR+lWO0JRLECGdqpy+oF86z3F1olixP07VoMUykUn/oZeMByyV0Xw/iuvvVn
	jaefKAWF6Wgkb2E9Kf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKQhW-005Nrd-GN; Tue, 24 Jan 2023 21:19:30 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKQhI-005Nmq-Gw
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 21:19:17 +0000
Received: by mail-qt1-x82a.google.com with SMTP id z9so14318665qtv.5
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 13:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K8tBkVDcR3cIjvCGSV7pCzotu/GYoRW4uPdPyTobpUU=;
        b=q/9e3e2NeK80DecsM1DxuwcETnH6bT2rG52Bz4kbxpn9ZUDkALoLB/GXpmZoTETo3u
         ZXWm/Y/fmSX/kQyrHvV20YZQMs6JQ6Sv9WnFxs0h8Vb/wNoXLt9n+bjCzB7Tu7QAtLZu
         CphXsH2+n8rm0whA1MrKA/9G7ZIUvx5OyeW2yY1CL8d+ZudMrtoaVSPZgjTh6cjycO3K
         CpQ+tnxejzvBgLmnrJjgTB2YCsA64fDR0qKx9NbotZOJrwSu4OEI+75HS8Q1t8Lip+h9
         xx5k9FZo0LIWwoLSrE8fk5zFe2yJYpbldsvt0WmLZ7b3jbz6ggh+xGtIyvyT19rsgUiS
         r3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8tBkVDcR3cIjvCGSV7pCzotu/GYoRW4uPdPyTobpUU=;
        b=J/vPu/gUH8jpsOGeCTO/mEu9LGCLZE8SbDhSMuugwx00Mu+K0H1OisO8d6Q9nXfaas
         XCrp8HiIci91dq8yeojTnYmz78n9/VkSxR758hm459dXZqU6bfxe2oUXMADXqR1ddYN+
         gyae8l8isHkkzcyDXwBy2cbEOo28RGQeSEify4NpYX64lGrj80tAOdZLXHu7ChvwbR/S
         y40FcRZO8YiK88wnKw4tufhygwLSN+MjurrWOsl2To2khlrB4/L9LtXyoGj/kI2UUzyp
         mHt+Go10HehPYLCNR6nUx6pivVUjiOHAvkHFYsIJo0NSN3XSjGWpDVcWsjGXzeUlN+pm
         D7EQ==
X-Gm-Message-State: AFqh2kozdsVjw8sfq9xQedsEy8605U+w0ANXOJ0Ov+stT92tYW3vBuIt
	6xArYQqBVNqKCFucO16PxUVGAQ==
X-Google-Smtp-Source: AMrXdXvVfqjmstskpsb+7KNHHK7XTOLpCh5jIf1Zf8VZzT8oMkYcJQXg4wGwRvhcYM63kTu9+3C+7Q==
X-Received: by 2002:ac8:6792:0:b0:3a8:1793:76d6 with SMTP id b18-20020ac86792000000b003a8179376d6mr40904443qtp.68.1674595153462;
        Tue, 24 Jan 2023 13:19:13 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id i7-20020ac84887000000b003b6a17e1996sm1965508qtq.83.2023.01.24.13.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 13:19:12 -0800 (PST)
Message-ID: <40a7e1171d7777128c0728a28a029e6f3643145a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/2] media: meson: vdec: implement 10bit bitstream
 handling
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: neil.armstrong@linaro.org, Christian Hewitt
 <christianshewitt@gmail.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org,  linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Benjamin Roszak <benjamin545@gmail.com>
Date: Tue, 24 Jan 2023 16:19:11 -0500
In-Reply-To: <95132025-8f0f-8179-40b7-8bf83458886a@linaro.org>
References: <20230124034058.3407235-1-christianshewitt@gmail.com>
	 <20230124034058.3407235-2-christianshewitt@gmail.com>
	 <6ff68c4bea9d48980853e9af9db1fc0bf13976ae.camel@ndufresne.ca>
	 <07933226-fbab-fa78-6b96-38e365577605@linaro.org>
	 <478d5a7569b7879aa3410a5b3049d745867df780.camel@ndufresne.ca>
	 <95132025-8f0f-8179-40b7-8bf83458886a@linaro.org>
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_131916_574985_F1BE6BC8 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCkxlIG1hcmRpIDI0IGphbnZpZXIgMjAyMyDDoCAxNzo1MSArMDEwMCwgbmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZyBhIMOpY3JpdMKgOgo+IFdlIGhvcGVkIHdlIGNvdWxkIHVzZSB0
aGUgc2FtZSBtb2RpZmllciBhcyBEUk0sIGJ1dCBpdCBzZWVtcyB0aGlzIGlzIG5vdyBvdXQgb2Yg
c2NvcGUuCj4gCj4gTmVpbAoKSXRzIG5vdCBvdXQgb2Ygc2NvcGUsIGl0cyBqdXN0IG5vdCBiZWlu
ZyB3b3JrZWQgb24uIFRoZXJlIGlzIG5vIGluZnJhIHRvIHN1cHBvcnQKYW4gZXh0cmEgNjRiaXQg
bW9kaWZpZXIgaW4gVjRMMiBhdG0sIG9yIHRvIHVzZSBEUk0gZm9ybWF0cyBpbiBnZW5lcmFsLiBG
b2xrcwpmb3JtIFF1YWxjb21tIG9yIE1lZGlhdGVrIGRpZG4ndCB3YW50IHRvIGRvIGl0LCBzbyB0
aGV5IHdvcmtlZCBhcm91bmQgYnkgYWRkaW5nCnRoZWlyIHN0cmljdGx5IG5lZWRlZCBzdWJzZXQg
b2YgY29tcHJlc3NlZCBmb3JtYXRzLiBJZiB5b3UgZG9uJ3Qgd2FudCB0aGlzLCB0aGVuCmZpbmUs
IGJ1dCBJJ20gbm90IGF3YXJlIG9mIHNvbWVvbmUgYWN0aXZlbHkgd29ya2luZyBvbiB0aGF0IHRv
ZGF5LgoKSSB3YXMganVzdCBjdXJpb3VzIGlmIHRoZXJlIHdhcyBhbnl0aGluZyBvdGhlciB0aGVu
IE5WMTIgKHNvbWV0aGluZyAxMGJpdCkgb24KdGhlIHNlY29uZGFyeSBidWZmZXIgY2FzZSwgdGhh
dCB3YXMgbXkgaW5pdGlhbCBxdWVzdGlvbiBoZXJlIDstRC4KCk5pY29sYXMKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
