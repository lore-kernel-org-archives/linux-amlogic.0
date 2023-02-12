Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BEBC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 02:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vInGOlmAQL5wwyfD/HlsQpxzAJzmE3wmkYVfvB8CDQ=; b=CnvwzG8df3YUJL
	mO7UvUwmYiwvKCf9JtTQzaukx0CvpOeKWCx0x5OCGTO7iPJAoUg02XsKp85Yq85k6/+uy9+fw72NF
	2ksBvD6V4kptRMfO9JqCUsZoQnMbsPuIoeCWFhziSgz8VHpjvem5PKhtVmMqquH0PuxZc9pzbgQvD
	bEHBC3c5UQOlsQiivoMRKbEac9FJp2wXGBFX2x+8r9YjKYEbJSSr+p0VGeu1WPgn8CZdfiNHGYHp2
	JV5QHEsefTvJiNN7uTsJtbdjzFJDSM2xN1RuYGH1kvfRG20wvpUSeBeE6V8+WzSkVQW8149xx0Nop
	67UDuyPKjYE3cbmv1SkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR2Ft-00AloP-0i; Sun, 12 Feb 2023 02:38:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR2Fq-00Alnk-NQ
	for linux-amlogic@lists.infradead.org; Sun, 12 Feb 2023 02:38:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id k3so1406427wrv.5
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Feb 2023 18:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5KtTCkQO962+ofw5JUXqli30tDo3+JwMw5y/z3+uHw=;
        b=frCznAwvnOhrDtfA+5CFK5aA6YonudQ+5dFTRZqxttHw9+bn+de7BopeGUz+1TT6ZJ
         agNCoM4hXObL0ws4n36yjbIRU68whP67tiYnHf0FKjMAi7cswq0JnbWmAUt8OCg4Z3mG
         R+wF3fZzYpk+FRr+WuIfmwdms0+NQkVyy0omAgUWKIicspMPQziyQQ4aK3ckGl0ruOp6
         CImRfzUXprpUD7qF839xKIuQC4f4ZhfIjiuisDwadr1EP+zA/4h/m53yoAcPk8DUM83T
         8MLT/Du1ptlLSWdBE9W13D1bjRZcF8NGMnZrsFIyblRrVvW7wUN43X35V7WjfhyajwrS
         u0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5KtTCkQO962+ofw5JUXqli30tDo3+JwMw5y/z3+uHw=;
        b=x4PUZswqjLX71aJ26WTUDlqLqtqTXl19OLVYJmo3C92aHj0vHQX+P96JzLsnycg0xK
         6IfWq2l7W3vaXDRD9NJ1/lpdKMQN8oXHMfBC8DNL/gLIf848mRBSUMMsYu1MsYG/wrQ7
         QhXQX8PK7jOCNOEeU2tZWh/SMcpuZbAuDSumh2lDgz7Q52xiyFmO9Kf0Yz6nBO0TjA24
         PRbFUouaEfb1UC09nBz1u+sDjfzmnDKfd7XS81c0+9x0t2CAbDF5413VY5ZG4ndlflhp
         9j7koOevYXy+LiIkBS6KZou8B0XgVbTc2eJ1EabmzyaDx///ZoQcaNKRkl23q4BpdLpm
         HwYw==
X-Gm-Message-State: AO0yUKVEN9380fSWrRbK34UQCKeIdGFNXKNl0YhgOitL/uHaQYqUDYHr
	rLYymQZz45pErC79zWCB0KQ=
X-Google-Smtp-Source: AK7set+G1qKhsfecv3dWRw8a+VhdjEagMY8oPlccgP7cYZ3k6VKOEx9STIA6Yu35dfp3LgP/Z9bfTA==
X-Received: by 2002:a5d:4d0d:0:b0:2c5:5382:7f9 with SMTP id z13-20020a5d4d0d000000b002c5538207f9mr826935wrt.30.1676169489481;
        Sat, 11 Feb 2023 18:38:09 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id i14-20020adff30e000000b00241fab5a296sm7255702wro.40.2023.02.11.18.38.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Feb 2023 18:38:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Regression caused by 066ecde6d826b443 ("mmc: meson-gx: add SDIO
 interrupt support")
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <Y+g114kasLS6/x12@geday>
Date: Sun, 12 Feb 2023 06:38:05 +0400
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linux Amlogic <linux-amlogic@lists.infradead.org>
Message-Id: <2CB0C2EC-B084-4185-843D-3DEADAC5864B@gmail.com>
References: <Y+fU96RVq4GwKaDH@geday>
 <bd2dc69d-f7b0-bc60-782f-34ac497d9507@gmail.com> <Y+g114kasLS6/x12@geday>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_183814_823922_E60B9B91 
X-CRM114-Status: GOOD (  13.44  )
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

Cj4gT24gMTIgRmViIDIwMjMsIGF0IDQ6NDEgYW0sIEdlcmFsZG8gTmFzY2ltZW50byA8Z2VyYWxk
b2dhYnJpZWxAZ21haWwuY29tPiB3cm90ZToKPiAKPiBPbiBTYXQsIEZlYiAxMSwgMjAyMyBhdCAx
MTo0NDoyNVBNICswMTAwLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+IE9uIDExLjAyLjIwMjMg
MTg6NDgsIEdlcmFsZG8gTmFzY2ltZW50byB3cm90ZToKPj4+IEhpIEhlaW5lciBhbmQgVWxmLAo+
Pj4gCj4+PiBBZnRlciB1cGRhdGluZyB0byBrZXJuZWwgNi4yLjAtcmM3IGZyb20gNS4xOS4xIG15
IEg5NiBQcm8rIFRWIEJveAo+Pj4gKEFtbG9naWMgUzkxMikgZmFpbGVkIHRvIHByb3ZpZGUgd2lm
aS4gVGhlIG1vZHVsZSBpbiBxdWVzdGlvbiBpcyBhCj4+PiBRQ0E5Mzc3IFNESU8gZHJpdmVuIGJ5
IGF0aDEway4KPj4+IAo+Pj4gUmV2ZXJ0aW5nIDA2NmVjZGU2ZDgyNmI0NDNmNDkyNTcwZTA4MGNi
YTNmMjIxMjI4MGQKPj4+ICgibW1jOiBtZXNvbi1neDogYWRkIFNESU8gaW50ZXJydXB0IHN1cHBv
cnQiKQo+Pj4gc29sdmVzIHRoZSBwcm9ibGVtIGFuZCBJIGhhdmUgd2lmaSBhZ2Fpbi4KPj4+IAo+
Pj4gVGhhbmtzLAo+Pj4gR2VyYWxkbyBOYXNjaW1lbnRvCj4+IAo+PiBTdXBwb3NlZGx5IHRoaXMg
cGF0Y2ggcmV2ZWFsZWQgYW4gaXNzdWUgd2l0aCBpbmNvcnJlY3QgaW50ZXJydXB0Cj4+IHRyaWdn
ZXIgdHlwZXMuIEEgZml4IGlzIGN1cnJlbnRseSBpbiB0ZXN0aW5nOgo+PiA4N2VmNjM4ZDY1NTcg
KCJURVNUOiBhcm02NDogZHRzOiBhbWxvZ2ljOiBNYWtlIG1tYyBob3N0IGNvbnRyb2xsZXIgaW50
ZXJydXB0cyBsZXZlbC1zZW5zaXRpdmUiKQo+PiAKPiAKPiBIaSBIZWluZXIsIGFuZCB0aGFua3Mg
Zm9yIHRoZSBxdWljayByZXBseS4KPiAKPiBJIHJldmVydGVkIG15IHJldmVydCBhbmQgYWRkZWQg
dGhlIFRFU1QgcGF0Y2ggYWJvdXQgaW50ZXJydXB0cyBpbiB0aGUgRFQKPiBidXQgc3RpbGwgaGFk
IG5vIGx1Y2suCj4gCj4gV2hhdCBzb2x2ZWQgbXkgcHJvYmxlbSB3YXMgYWRkaW5nICJjYXAtc2Rp
by1pcnEiIHRvICJzZF9lbW1jX2EiIERUIG5vZGUuCj4gTm93IGFsbCBpcyB3ZWxsLgoKQ29uZmly
bWluZyB0aGF0IHNldHRpbmcgY2FwLXNkaW8taXJxIHJlc29sdmVkIHRoZSBjb250aW51aW5nIGlz
c3VlcyBJ4oCZdmUgc2VlbiB3aXRoIGFuClFDQTkzMzcgbW9kdWxlIGFmdGVyIHJlc3RvcmluZyB0
aGUgU0RJTyBpcnEgY2hhbmdlcyBhbmQgcGlja2luZyByZWNlbnQgZml4ZXMgdG8gbXkKYnJhbmNo
LiBUaGFua3MgR2VyYWxkbyEKCknigJl2ZSBub3Qgb2JzZXJ2ZWQgaXNzdWVzIHdpdGggQnJvYWRj
b20gbW9kdWxlcywgb25seSBRQ0E5Mzc3LCBidXQgaXMgdGhpcyBzb21ldGhpbmcKdGhhdCBzaG91
bGQgYmUgZGVmaW5lZCBmb3IgYWxsIHNkX2VtbWNfYSBub2Rlcz8KCkNocmlzdGlhbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
