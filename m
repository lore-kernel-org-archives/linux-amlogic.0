Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A54C31E48
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:00:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BF3520B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UH5+PjKR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CHleG6FA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BF3520B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPAALgG7r0boBQmCOS7WO677AfC0m7tggHu5sGS4gMQ=; b=UH5+PjKRmGS3NU
	IdrNMZEdM+yfOn/9VVeMCbZxe6jb0FQxvdTglL8fd+tfb3sGaGmVts3mVGulvhSJUQOqowA0wmiEg
	FBISpzHPk6U4q60C+2PGrsH0nKGWxEDBFLZaWrV7vBVJHgwXiIRKFt4yL64KZ/hFZjwcRuMvIKBCS
	nJsbNvK9Q9JnPp9f7Kx6HOjBNQhGmA2BtyMkZ1mZxRIUwYjM0Al6yZdLBGRK0UEnhdzEsC/3INUzn
	vguapJUCRZhc1Ktc4w6/zjsZkxqtzuEr1rJG7FInmDZU3E9OtRB6LLEPoN0mAcJBpX8B6AugfmpqR
	sMYRm7KvqGyFLq4ABvHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb9QD-0007Ct-Qi; Wed, 12 Jun 2019 20:00:37 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb9PE-0005GQ-7m; Wed, 12 Jun 2019 19:59:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id d18so18220592wrs.5;
 Wed, 12 Jun 2019 12:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KG5NgbEDvB0IWCaREHnEKhv/7oNCiEy8ooK1MlRzIPs=;
 b=CHleG6FA879in8tltHJpvsgIsf5EZHkqvpt/fkvG7bN3tzs+3eV9pxxdayzsj3bWPE
 6phqQcl5xXzRfzen7XMRLmPQoqsw2FYntWAColSUhMZHk4WSuBEMlunBhNnY36o7AcRq
 WugutDifp774LpTT8xW7NZnh8Xm1iHcIvs9NgjqJAJ5UWz3qbqtUCq3lXXVPlnEODES7
 MA7sWXkp/3NuDFYVD7GuA2NZEis7efWRa3g+InIacSbt0C9UxZusIzRT6xaJwL1T5F3k
 kgwnjIKVV+apPIiNxTmT+Iz73IjPY/4Is0TPkJCyKX4XPvFzts81bNm9C3UP5uItrcH9
 Qjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KG5NgbEDvB0IWCaREHnEKhv/7oNCiEy8ooK1MlRzIPs=;
 b=eY84RGCHcJE2TuGOWqxJpOAZ9t62ksw/V2TCs/doWKOQh+6JKKZ+TUTLKtQzzG7IJs
 myhEuqtbSBiBHlR3WeSHc2rp9EBEYliuVnq8qFEkvOOXAxfIOojEoJxdyZzV0Wfdr/f9
 YAx9tqP4m7Pk7NusRzhwRy6pvHUDP8LPzyHP87veT3ugiZ4z5FRSfGO0vfo6Au5Nt/hJ
 oJu/322FEE9DHb64jqhiLAVljqcq/aCGNpPnWJ7VM4mbe3V21PhRF9wIHA3yr4E4SYX/
 qKYe+JxrTw8qSATxk1qXow90Vt+IdMKDA7kFkGS2JLN3HJx9ZMehNeYG6QJCvw8TzNnn
 MPaQ==
X-Gm-Message-State: APjAAAXn3xamqWxK7G8tsUb060A7lzhl5Q2maD2SMDoSt6cgk05o8nOX
 iBLsDDWFgEZigQDugSCqTidAK+Dk
X-Google-Smtp-Source: APXvYqy/wh0jbkT+eAUNg4R4m3wc3iCjuVQTA417SP7ImsnL978LUI+5DY8GjJq0y4lA6mp22EcdFA==
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr26414553wrt.141.1560369573815; 
 Wed, 12 Jun 2019 12:59:33 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f10sm1026745wrg.24.2019.06.12.12.59.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 12:59:33 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v3 03/14] pwm: meson: use GENMASK and FIELD_PREP for the lo
 and hi values
Date: Wed, 12 Jun 2019 21:59:00 +0200
Message-Id: <20190612195911.4442-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
References: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_125936_282353_F9335943 
X-CRM114-Status: GOOD (  11.89  )
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
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

bWVzb25fcHdtX2NhbGMoKSBlbnN1cmVzIHRoYXQgImxvIiBpcyBhbHdheXMgbGVzcyB0aGFuIDE2
IGJpdHMgd2lkZQoob3RoZXJ3aXNlIGl0IHdvdWxkIG92ZXJmbG93IGludG8gdGhlICJoaSIgcGFy
dCBvZiB0aGUgUkVHX1BXTV97QSxCfQpyZWdpc3RlcikuClVzZSBHRU5NQVNLIGFuZCBGSUVMRF9Q
UkVQIGZvciB0aGUgbG8gYW5kIGhpIHZhbHVlcyB0byBtYWtlIGl0IGVhc2llciB0bwpzcG90IGhv
dyB3aWRlIHRoZXNlIGFyZSBpbnRlcm5hbGx5LiBBZGRpdGlvbmFsbHkgdGhpcyBpcyBhIHByZXBh
cmF0aW9uCnN0ZXAgZm9yIHRoZSAuZ2V0X3N0YXRlKCkgaW1wbGVtZW50YXRpb24gd2hlcmUgdGhl
IEdFTk1BU0soKSBmb3IgbG8gYW5kCmhpIGJlY29tZXMgaGFuZHkgYmVjYXVzZSBpdCBjYW4gYmUg
dXNlZCB3aXRoIEZJRUxEX0dFVCgpIHRvIGV4dHJhY3QgdGhlCnZhbHVlcyBmcm9tIHRoZSByZWdp
c3RlciBSRUdfUFdNX3tBLEJ9IHJlZ2lzdGVyLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVu
ZGVkLgoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bT4KUmV2aWV3ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Ci0tLQogZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCA4
ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdt
LW1lc29uLmMKaW5kZXggMzViMzhjNzIwMWMzLi5jNjJhM2FjOTI0ZDAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcHdtL3B3bS1tZXNvbi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCkBAIC01
LDYgKzUsOCBAQAogICogQ29weXJpZ2h0IChDKSAyMDE0IEFtbG9naWMsIEluYy4KICAqLwogCisj
aW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KKyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+CiAjaW5j
bHVkZSA8bGludXgvY2xrLmg+CiAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+CiAjaW5j
bHVkZSA8bGludXgvZXJyLmg+CkBAIC0yMCw3ICsyMiw4IEBACiAKICNkZWZpbmUgUkVHX1BXTV9B
CQkweDAKICNkZWZpbmUgUkVHX1BXTV9CCQkweDQKLSNkZWZpbmUgUFdNX0hJR0hfU0hJRlQJCTE2
CisjZGVmaW5lIFBXTV9MT1dfTUFTSwkJR0VOTUFTSygxNSwgMCkKKyNkZWZpbmUgUFdNX0hJR0hf
TUFTSwkJR0VOTUFTSygzMSwgMTYpCiAKICNkZWZpbmUgUkVHX01JU0NfQUIJCTB4OAogI2RlZmlu
ZSBNSVNDX0JfQ0xLX0VOCQlCSVQoMjMpCkBAIC0yMTcsNyArMjIwLDggQEAgc3RhdGljIHZvaWQg
bWVzb25fcHdtX2VuYWJsZShzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSkKIAl2YWx1ZSB8PSBjbGtfZW5hYmxlOwogCXdyaXRlbCh2YWx1ZSwgbWVzb24tPmJh
c2UgKyBSRUdfTUlTQ19BQik7CiAKLQl2YWx1ZSA9IChjaGFubmVsLT5oaSA8PCBQV01fSElHSF9T
SElGVCkgfCBjaGFubmVsLT5sbzsKKwl2YWx1ZSA9IEZJRUxEX1BSRVAoUFdNX0hJR0hfTUFTSywg
Y2hhbm5lbC0+aGkpIHwKKwkJRklFTERfUFJFUChQV01fTE9XX01BU0ssIGNoYW5uZWwtPmxvKTsK
IAl3cml0ZWwodmFsdWUsIG1lc29uLT5iYXNlICsgb2Zmc2V0KTsKIAogCXZhbHVlID0gcmVhZGwo
bWVzb24tPmJhc2UgKyBSRUdfTUlTQ19BQik7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
