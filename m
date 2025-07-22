Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B983BC83F27
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jul 2025 19:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5sg7ZuZTkWV5AyMXueYYUa9ALr+vThzlTJ+zqhyxFk=; b=xrnf+BQ4QnFpiF
	as1oUuKaidOFqObIYRnA9TqvFTm9dAFk0h5yDlzPGVaw4hk22kMbUpwggRbRHm/SGQa2p8o5qE2W0
	dx1GjDoLQ/xiB/rFBEP0+lt0VqSE8Ytxe0voF9JfYZNjM8MabIrRbJr3Axuk2AnOz+JfET0C8rNNW
	R2KFFu2Au4MRuoBu3ZPxvr28iUEYtRSU1OpWk+VyxKQQ83FRaMoZk8O4bWPALD2icsdUOFPQ6nl+n
	YWrC2U/47l5xO6LoSF9bNTWqYj2moD12DF9lrRpbiEtCnFtRRCdeH0H7PzVe2Qda5G1EGV7HkL7ij
	mQUkCcJdZe5SIfSPVmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIwS-00000003N24-3LgB;
	Tue, 22 Jul 2025 19:46:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIqK-00000003Mgq-0MsS;
	Tue, 22 Jul 2025 19:40:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23aeac7d77aso50029395ad.3;
        Tue, 22 Jul 2025 12:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753213203; x=1753818003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFHh26tngjjOWxvj7gs0dFekGysBV5VC2fWJw/vtwp0=;
        b=DkBEW+5QC9CZUUANIZ9kRHliSNnHlXjmteWauhouHws29A7vKmkuxO2cZK3Iee5+Yn
         vSFzdFiyHDDgjPB23Hl7pnS+DPeDpMO+ngLBmuElBco9aFE2JmrsExF/ocOIEtayZ4s0
         YzMcgumHsmSPMNwUz62SX+c5vLs+YEcnP0jOi473ZPLmSy7e4rKDJO6RfvyYk1yC8yJK
         KuSM7LQ99JJa99ceCJ29nVSftxuEw7t46nC+SO591ZkLqvakc5STbbw4o9UV685KxaKo
         wyJ44770lo/g6Ahz51s//e6l1NKLNnD7/2a0R5wG/prcOJ4zqXWrnTWBD3vhEQgyESP3
         zJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753213203; x=1753818003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFHh26tngjjOWxvj7gs0dFekGysBV5VC2fWJw/vtwp0=;
        b=bPkckR6a3Wh0hg5XtWiszYrS7Jsiu+OQFP6mIrMM13bs1bupvoMBYexzq+fQeyTFwB
         EK7klj2xLfGv4mE6RpZuzM/cc2W7234dw6I+wYn98xicoUrtYaY5vODKSYLh1mQJZWMV
         XTr/StlsGgf9kV96i+T7jojsEr5/SI7DKU1qg7vHfzUR/g7qWfrwhTDv8mDy4eE6AOpj
         RUY9OJtn3PUNUzcKkNYmzgPhRgh2zMwFXrEKcmj6kp6I4XCmWTyyTksivoWSAXE8N8VY
         Xa42Z2tKuTDbvf6FfuK7lipzBH8h7b2mhnREuF6XJtYzUVx6U6CfCUqxmYNNLbQu8HBJ
         VROA==
X-Forwarded-Encrypted: i=1; AJvYcCUTxpgpb1fJQy9XdmpzUd41vPWfRH7fWNaJOOHmoKlKIyTWN2lVzUvRTyGTOq6G/s7hC6/fQcRTg65YHeeK@lists.infradead.org, AJvYcCVIBfACAnqA9GF0GgEiKaQNEt4cpkoD6WvAsDP5P5rNT2fOfHVrmKBRs0ltZIFObRzf2zVhCKwHeUNYh6j2Vpy/pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLbBkcPqMmpQzYqYE6FFte2he3CzLu1+jwn2MQPglbDgEFVRsb
	IbrmlnIYO54PeTHdLgdVeGtBLAsAcc94EGiqyPEujGPhzUt69ZAeMKdlmNIOQR3UIrhb12hB07j
	dIBV8lO3V+RgXZ6/znOV1qdOVnjsUI6A=
X-Gm-Gg: ASbGncsvNOWqn9UCA20+1pwJlowiQ5zDuLH//9yOUC4bsjn7GaCsoHXVwVpfuMvhM1Y
	M7zC+Vqmi7DxZz2TA/JKFZ6eSbhJJ1NP7NuxZiz+BbHU0myRrTmFs+swLD+n/H78pxxFBdnu8ib
	DUR2ISqWlRE7L/PVHjt+abfim28C148xW2Zn2UTtAF7iQvIpEuyVAiPN21Awjj1qDJJtp6tsE5P
	XqVMH9vD5Rwqa6OvbAdlw==
X-Google-Smtp-Source: AGHT+IFIqpmViQQPAMoz9A8CgWPtW74p4X/bJekUGHNRxdcVs5bjkGSvAitsvNLAJCN+CgYdarBLE7R9a1p3Lo1pKgI=
X-Received: by 2002:a17:902:c94c:b0:234:914b:3841 with SMTP id
 d9443c01a7336-23f9821d17dmr2411785ad.39.1753213203378; Tue, 22 Jul 2025
 12:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-optimize_clk-measure_accuracy-v2-1-cb121fd57e6d@amlogic.com>
In-Reply-To: <20250722-optimize_clk-measure_accuracy-v2-1-cb121fd57e6d@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Jul 2025 21:39:52 +0200
X-Gm-Features: Ac12FXzqGorcphSDKwJZcIy0MTfbMgQR4dWhRz0iZJDpFAl1w4AsnBzrEgOES8M
Message-ID: <CAFBinCAvLzDQCDh6z9soDiyq4sBXZ7XUQf3-Np4pFZTPmHN2AA@mail.gmail.com>
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize measurement accuracy
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_124004_130059_269FDDE4 
X-CRM114-Status: UNSURE (   8.99  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgODowOeKAr0FNIENodWFuIExpdSB2aWEgQjQgUmVsYXkK
PGRldm51bGwrY2h1YW4ubGl1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJv
bTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4KPiBUaGUgY3ljbGUgY291bnQg
cmVnaXN0ZXIgaGFzIGEgMjAtYml0IGVmZmVjdGl2ZSB3aWR0aCwgYnV0IHRoZSBkcml2ZXIKPiBv
bmx5IHV0aWxpemVzIDE2IGJpdHMuIFRoaXMgcmVkdWNlcyB0aGUgc2FtcGxpbmcgd2luZG93IHdo
ZW4gbWVhc3VyaW5nCj4gaGlnaC1mcmVxdWVuY3kgY2xvY2tzLCByZXN1bHRpbmcgaW4gKHNsaWdo
dGx5KSBkZWdyYWRlZCBtZWFzdXJlbWVudAo+IGFjY3VyYWN5Lgo+Cj4gVGhlIGlucHV0IGNsb2Nr
IHNpZ25hbCBwYXRoIGZyb20gZ2F0ZSAoQ29udHJvbGxlZCBieSBNU1JfUlVOKSB0byBpbnRlcm5h
bAo+IHNhbXBsaW5nIGNpcmN1aXQgaW4gY2xrLW1lYXN1cmUgaGFzIGEgcHJvcGFnYXRpb24gZGVs
YXkgcmVxdWlyZW1lbnQ6IDI0Cj4gY2xvY2sgY3ljbGVzIG11c3QgZWxhcHNlIGFmdGVyIG11eCBz
ZWxlY3Rpb24gYmVmb3JlIHNhbXBsaW5nLgo+Cj4gVGhlIG1lYXN1cmVtZW50IGNpcmN1aXQgZW1w
bG95cyBzaW5nbGUtZWRnZSBzYW1wbGluZyBmb3IgY2xvY2sgZnJlcXVlbmN5Cj4gZGV0ZWN0aW9u
LCByZXN1bHRpbmcgaW4gYSDCsTEgY3ljbGUgY291bnQgZXJyb3Igd2l0aGluIHRoZSBtZWFzdXJl
bWVudCB3aW5kb3cuCj4KPiArMSBjeWNsZTogMyByaXNpbmcgZWRnZXMgY2FwdHVyZWQgaW4gMi1j
eWNsZSBtZWFzdXJlbWVudCB3aW5kb3cuCj4gICAgIF9fICAgIF9fICAgIF9fCj4gIF9f4oaRICB8
X1/ihpEgIHxfX+KGkSAgfF9fCj4gICBeICAgICAgICAgICAgIF4KPgo+IC0xIGN5Y2xlOiAyIHJp
c2luZyBlZGdlcyBjYXB0dXJlZCBpbiAzLWN5Y2xlIG1lYXN1cmVtZW50IHdpbmRvdy4KPiAgICAg
X18gICAgX18gICAgX18KPiAgX1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEKPiAgICAgXiAg
ICAgICAgICAgICAgIF4KPgo+IENoYW5nZS1JZDogSWYzNjdjMDEzZmUyYThkMGM4ZjVmMDY4ODhi
YjhmMzBhMWU0NmI5MjcKPiBTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxv
Z2ljLmNvbT4KVGVzdGVkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rp
bmdsQGdvb2dsZW1haWwuY29tPgphbmQgd2l0aCB0aGUgQ2hhbmdlLUlkIChzb3JyeSwgSSBtaXNz
ZWQgdGhhdCBwYXJ0KSBkcm9wcGVkIGFzIE5laWwKc3VnZ2VzdGVkIGFsc286ClJldmlld2VkLWJ5
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
PgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
