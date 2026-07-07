Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F15C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqMF0pFZgpvrTeWExryqbV7cmgdG1+iJ8eCTIxggGK8=; b=A2+tE0p0hzYIJw
	3TDgQxTVxzgo8/zXoxq8uhuc3wX/T4ZxVgqSdkZfJIOPtyuMw1pyFyaBa5WOPGpC4MnP/lfPWRNBs
	qDyKYVKzNwasVHfwbwIOFr3j/DqfmQhxPySV1TylUKuZk8iZMtGZDE5MElqxe7nFil4W2m5kKApg3
	fccxEGsJ+IUhw75aaY8JuhtIXX4wlfUZCUMLhKbSDmAMhbz3NH0MIGLb7C0W4pMiwQ4KPIKtW3Fmk
	G83ZtDSiS/SE9Ke34eFnTcP4NQeO540q7q2RAdJzSAcYfMBPQOtp2QdEklMdw+z2MJDuVFonZCdcR
	82BOtf7yjlAChjlkdS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBcc-0000000FmTK-1ziU;
	Tue, 07 Jul 2026 19:38:22 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBca-0000000FmSI-1vAT
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:38:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso3886695a91.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453100; cv=none;
        d=google.com; s=arc-20260327;
        b=G+/0P6WmZPq+qR0Kjk0MyDDAmYZyOxyO2qhDBN4Mr+F0PXd047kgzicAmrEZmqvTQG
         Y5YfL9yavJihVdJEj9wbspbZJBO9J28ssL/BgyozHf7LvUlZkuPXsQPaz/hFFql1ojf1
         QP8ugXPCzTHxKeSfbH4tCXXAC3692vp4zwyCrsPgYleq33QjgMM8bL+MS9/l+wF/Weyg
         M01ZQode+tbLPhIdWlHmC4Bv6/4CeOTlsPl5mkFm5W0OPj4JWd3gQrLFNpC61UiaU2yI
         w3siBqF6Cve/++NsCL8goQtv6cc4+4UzBtUHwQTY7gJQ4rOY9hsSWUeu/Xrs4IjaDzej
         a+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        fh=ssUPeV9czpDUPvhICL/XRJ9rcz/3iE195D8DeySsMkM=;
        b=RDdESh0OzlDXpbwpea/wcoC90o96GELAZGfR45lSeIXyIuFUpiltiPm8jd11gt0UgR
         6antP5nxzL93IWRQu7D5VAYY9zASeIopyLRqS4fa5iJ6nShwISgDwYzcnpHmXysB5BQO
         iLzeifxrhh5Xs8ncXKwIUMS6+eEsnIpig4+7I028hA1uRhcnfqoAu2HKqetxaNbe+g98
         laXGK2QZxQut1SsnU0sJyB0RPOyUm09yqEYpUSBQnZT5yMrMU/xEMVcWNyzAMtRue+4K
         P7VVvVYwNaAyAGaNggE7tcakVp7qIrp8BM/AXEIjalIod6H978h5NbPi/PaGMIvR46m1
         sLJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453100; x=1784057900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        b=G7y1GOkOF54C9xRyheRODTsr+wb8PE3Ux1Vk9k45e2Q8O+ukvvuLbIGoYpMtlDT5Pb
         utXPiafovbYFsNnqNoRD/+AGLkydIlHQ8lgPEURYhZZQbu0yYuedRlZOiZZb7612PWhG
         rcocqTq31fAXpx/fNSP5Ve8X3D3/rwfQI34pN2jR8TN+EwJFz3byzLkwDdRSYlhfpP/M
         IjuaO04I6xBitW4soR4V6+7BeAtBi4zA+mvPe6eQcxVuWmTyGse+25Jl7fCQa5Q5EJRx
         aVP2vd/LaQSfiMf8s4z4BdmmP1uOxQzYOGAm4k9uP3tP9a7ABH1mE+wLYTkt2wrtDZXK
         j0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453100; x=1784057900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        b=WyLXwd3UU+jWlkPndCf2aV84KZzib3BbMEMcEMw/UU4+3x2y85lzwUAxi8dpAYDI9I
         n2Wk/NOr5a2X1cB/hqQyva+WQsv8yNPgpmOZexBAdQC6dvATou3ninJq+/JfjRxS2umR
         ZI3LdSPb1JTdqBHIH1mSBPbpE6CsPInT9BU0DovcY9YWtN9rCqv4xCaUfBCDeAFkV4Z2
         HGaz6U7LWcogO9W8xIc37J4EazovKq/3Pf500G3sWfD2lditor/jmDiwXBHqMG+rALTU
         D0uFXAyk9ybqldNlSbkVSP4803+09ifXNcqHwMxA5fN3fVjT3qqShFAv0cdNZLUVKwKs
         sT5w==
X-Forwarded-Encrypted: i=1; AHgh+RrdIsYzwhIh4L0wf+nBxqUroLG98fEKoIka+s4upQN2SqFyEpdrlA0yiKYWz0e4sLAep7bDufpWL09Fql8g@lists.infradead.org
X-Gm-Message-State: AOJu0YyITEIFSYQ4i1KWyzqrbl+ViuVUtu4HT97EEI/vz3Kciq2mscto
	aMszwzdgxyXOv00NYNehFqkVpKObYbNu2JXtkzfmzXO6HtLDs/LA3zgLMC6XAkidEexWJaXB39H
	srHt8xOf/I4FVOjdkhrn1hVnJsYB8p7c=
X-Gm-Gg: AfdE7clHnFKRxmkMK0e0IegmM/dZOw8N81xNiATMbxM2wRc/1Y41ELaBTGi3mpyfrma
	FwCmAw8xr8RK6eh1XpNjkE4ksNDRTUXmcVBNGleMafjdVke88xdFlGl0C+FbC3mnQgbQnCAu3GT
	UTZV2IK9Ce/wqvDWAJpQRAWuTtHIyKEUpR3v8dkW9XwEbYIdvYa56RYjSjDdOwcahWpgT03QZ2k
	q7M/5YH+3omG/kNfT1du7RPDc8Y7uDBtQBlwrXiA1aKEor145xXiPeXO5ereDItRI4giocV1exF
	rZp7b/TpnScQMsjAqhnq+lY+iWGBOgQ2/72K
X-Received: by 2002:a17:90b:2dcb:b0:383:5a16:bd70 with SMTP id
 98e67ed59e1d1-387582624f0mr6371414a91.16.1783453099684; Tue, 07 Jul 2026
 12:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-4-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-4-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:38:08 +0200
X-Gm-Features: AVVi8CegJ64Z2gd1io1fmLKunzl-GtPXQOMtd5GAEdMnAz5kN92Sdzb9oNcj0BA
Message-ID: <CAFBinCCB1dRkqq3DsFn4nL0RZ9-pRud5rDUxTz_2NokGaynLxQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy
 node by default
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123820_517560_843F7E67 
X-CRM114-Status: GOOD (  12.35  )
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

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgMzo1N+KAr1BNIEp1biBZYW4gPGplcnJ5c3RldmUxMTAx
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTZXQgdGhlIHBjaWVfcGh5IG5vZGUgdG8gImRpc2FibGVk
IiBhcyBpdCBpcyBub3QgdXNlZCBvbiBzb21lIGJvYXJkcwo+IGFuZCBzaG91bGQgYmUgZW5hYmxl
ZCBwZXItYm9hcmQgd2hlbiBuZWNlc3NhcnkuCj4KPiBUaGlzIGNoYW5nZSBzdXBwcmVzc2VzIHRo
ZSBkZWZlcnJlZCBwcm9iZSB3YXJuaW5nOgo+Cj4gcGxhdGZvcm0gZmY2NDQwMDAucGh5OiBkZWZl
cnJlZCBwcm9iZSBwZW5kaW5nOiAocmVhc29uIHVua25vd24pCj4KPiBUaGUgbWVzb24tYXhnIGR0
c2kgbm93IGRpc2FibGVzIHBjaWVfcGh5IGJ5IGRlZmF1bHQsIHNvIGVuYWJsZSBpdAo+IGZvciB0
aGUgczQwMCBib2FyZCB0byBzdXBwb3J0IFBDSWUgZnVuY3Rpb25hbGl0eS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEp1biBZYW4gPGplcnJ5c3RldmUxMTAxQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
